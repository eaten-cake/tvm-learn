#include <stdio.h>
#include <cuda_runtime.h>

// 错误检查宏
#define CHECK(call) \
{ \
    const cudaError_t error = call; \
    if (error != cudaSuccess) { \
        printf("Error: %s:%d, ", __FILE__, __LINE__); \
        printf("code:%d, reason: %s\n", error, cudaGetErrorString(error)); \
        exit(1); \
    } \
}

__global__ void vectorAdd(int *a, int *b, int *c, int n) {
    // 定义共享内存
    __shared__ int s_a[256];
    __shared__ int s_b[256];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < n) {
        // 将全局内存的数据加载到共享内存
        s_a[local_tid] = a[tid];
        s_b[local_tid] = b[tid];

        // 由于共享内存加载是并行的，需要同步线程，确保所有数据都已加载
        __syncthreads();

        // 在共享内存中进行计算
        int sum = s_a[local_tid] + s_b[local_tid];

        // 将结果写回全局内存
        c[tid] = sum;
    }
}

int main() {
    const int N = 1024;
    int *h_a, *h_b, *h_c;
    int *d_a, *d_b, *d_c;

    // 分配主机内存并初始化
    h_a = (int*)malloc(N * sizeof(int));
    h_b = (int*)malloc(N * sizeof(int));
    h_c = (int*)malloc(N * sizeof(int));
    for(int i=0; i<N; i++) {
        h_a[i] = i + 1;
        h_b[i] = i + 1;
    }

    // 分配设备内存（添加错误检查）
    CHECK(cudaMalloc((void**)&d_a, N * sizeof(int)));
    CHECK(cudaMalloc((void**)&d_b, N * sizeof(int)));
    CHECK(cudaMalloc((void**)&d_c, N * sizeof(int)));

    // 数据传输 Host→Device
    CHECK(cudaMemcpy(d_a, h_a, N*sizeof(int), cudaMemcpyHostToDevice));
    CHECK(cudaMemcpy(d_b, h_b, N*sizeof(int), cudaMemcpyHostToDevice));

    // 启动核函数（修正线程配置）
    int blockSize = 256;
    int numBlocks = (N + blockSize - 1) / blockSize;
    vectorAdd<<<numBlocks, blockSize>>>(d_a, d_b, d_c, N);

    // 检查核函数错误
    CHECK(cudaGetLastError());
    CHECK(cudaDeviceSynchronize());  // 强制同步等待核函数完成

    // 回传结果
    CHECK(cudaMemcpy(h_c, d_c, N*sizeof(int), cudaMemcpyDeviceToHost));

    // 验证结果
    bool success = true;
    for(int i=0; i<N; i++) {
        if(h_c[i] != (i+1)*2) {
            printf("Error at index %d: %d != %d\n", i, h_c[i], (i+1)*2);
            success = false;
            break;
        }
    }
    if(success) printf("All elements added correctly!\n");

    // 释放资源
    free(h_a);
    free(h_b);
    free(h_c);
    CHECK(cudaFree(d_a));
    CHECK(cudaFree(d_b));
    CHECK(cudaFree(d_c));

    return 0;
}

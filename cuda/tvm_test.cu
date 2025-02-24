#if (((__CUDACC_VER_MAJOR__ == 11) && (__CUDACC_VER_MINOR__ >= 4)) || \
     (__CUDACC_VER_MAJOR__ > 11))
#define TVM_ENABLE_L2_PREFETCH 1
#else
#define TVM_ENABLE_L2_PREFETCH 0
#endif

#ifdef _WIN32
  using uint = unsigned int;
  using uchar = unsigned char;
  using ushort = unsigned short;
  using int64_t = long long;
  using uint64_t = unsigned long long;
#else
  #define uint unsigned int
  #define uchar unsigned char
  #define ushort unsigned short
  #define int64_t long long
  #define uint64_t unsigned long long
#endif
extern "C" __global__ void __launch_bounds__(128) main_kernel(float* __restrict__ A, float* __restrict__ B);
extern "C" __global__ void __launch_bounds__(128) main_kernel(float* __restrict__ A, float* __restrict__ B) {
  B[((((int)blockIdx.x) * 128) + ((int)threadIdx.x))] = ((A[((((int)blockIdx.x) * 128) + ((int)threadIdx.x))] + A[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 1)]) + A[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 2)]);
}
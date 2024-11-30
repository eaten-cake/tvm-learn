import uaim

model_path = "model.onnx"

compiler = uaim.Compiler()

compiler.import_model(model_path, {"input": [1, 3, 112, 112]})

compiler.quantize()

compiler.generate_relay_ir_pdf()


using Pkg
using JuliaGLM

if Pkg.project().name != "ShaderSandbox" && !("--no-activate" in ARGS)
    Pkg.activate(joinpath(@__DIR__, ".."))
end

include("ShaderSandbox.jl")

import .ShaderSandbox

ShaderSandbox.run_app()

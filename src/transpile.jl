function handle_transpile(jl_code::String)::Union{String,Nothing}
    frag_code = missing

    try
        cfg = ConfigHandle()
        set_config_opts!(cfg; track_timing=("--transpiler-benchmarks" in ARGS))

        status, frag_code = transpile_code("begin $jl_code end", cfg, true)
        status != STC_SUCCESS[] && error("Transpilation failed!")

        return frag_code
    catch err
        showerror(stderr, err)
        return nothing
    end
end


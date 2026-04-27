const run_benchmarks = "--transpiler-benchmarks" in ARGS

function handle_transpile(jl_code::String)::Union{String,Nothing}
    frag_code = missing

    try
        expr = Meta.parse(jl_code)

        isnothing(expr) && return nothing

        if Meta.isexpr(expr, :error) || Meta.isexpr(expr, :incomplete)
            println(stderr, "Julia syntax error in '$path':")
            dump(stderr, expr)
            return nothing
        end

        frag_code = transpile(expr, run_benchmarks, true)

        return frag_code
    catch err
        showerror(stderr, err)
        return nothing
    end
end


module C

using Libdl

const LIBLUA = Libdl.dlopen(:liblua)
const FPTRS = Dict{Symbol, Ptr{Cvoid}}()

const ARGTYPES = Dict(
    :Cint => Integer,
    :Cstring => String,
    :LuaKContext => Integer,
)

argtype(s::Symbol) = haskey(ARGTYPES, s) ? ARGTYPES[s] : eval(s)
argtype(ex::Expr) = eval(ex)

# Generate a function which wraps a ccall.
# TODO: Passing ctypes is broken.
macro luac(ex::Expr)
    # Function name, quoted to be resolved as a symbol.
    fsym = QuoteNode(ex.args[1].args[1])
    # Function name, not quoted to declare the actual function.
    fname = esc(fsym.value)
    # Function return type. No conversions.
    ret = ex.args[2]
    # Function arguments to play with.
    args = ex.args[1].args[2:end]
    # Names of the function arguments.
    argnames = map(a -> esc(a.args[1]), args)
    # Types of function arguments.
    argtypes = map(a -> argtype(a.args[2]), args)
    # Function signature.
    sig = map(((n, t),) -> :($n::$t), zip(argnames, argtypes))
    # Types of arguments to send to ccall.
    ctypes = Tuple(map(a -> eval(a.args[2]), args))

    quote
        # Load the liblua function and store a pointer to it.
        FPTRS[$fsym] = Libdl.dlsym(LIBLUA, $fsym)
        # Export the function.
        export $fname
        # And finally define it.
        $fname($(sig...))::$ret = ccall(FTRS[$fsym], $ret, $ctypes, $(argnames...))
    end
end

include(joinpath("C", "types.jl"))
# include(joinpath("C", "lua.jl"))
# include(joinpath("C", "aux.jl"))

end

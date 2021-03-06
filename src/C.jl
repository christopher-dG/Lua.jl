module C

const depsfile = joinpath(dirname(@__DIR__), "deps", "deps.jl")
isfile(depsfile) ? include(depsfile) : error("""Run Pkg.build("Lua")""")

using Lua: L, LuaState
using Libdl

# Pointer to liblua.
const LIBLUA = Ref{Ptr{Cvoid}}(0)

# Store the pointer to the library at runtime.
function __init__()
    LIBLUA[] = Libdl.dlopen(liblua)
end

# C function pointers.
const FPTRS = Dict{Symbol, Ptr{Cvoid}}()

# Make function signatures and return types a bit more friendly.
const Str = Union{Cstring, String}
argtype(s::Symbol) = get(() -> eval(s), ARGTYPES, s)
argtype(ex::Expr) = eval(ex)
rettype(s::Symbol) = get(() -> eval(s), RETTYPES, s)
rettype(ex::Expr) = eval(ex)
const ARGTYPES = Dict(
    :Cint => Integer,
    :Csize_t => Integer,
    :LuaKContext => Integer,
    :Cstring => Str,
)
RETTYPES = Dict(
    :Cint => Int,
)

# Generate a function which wraps a ccall.
macro luac(ex::Expr)
    # Function name, quoted to be resolved as a symbol.
    fsym = QuoteNode(ex.args[1].args[1])
    # Function name, not quoted to declare the actual function.
    fname = esc(fsym.value)
    # Function return type.
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
    ctypes = map(a -> eval(a.args[2]), args)
    # For functions which take a LuaState, define a second method with a default argument.
    hasstate = !isempty(ctypes) && ctypes[1] === LuaState

    quote
        # The __init__() function has yet to run, so LIBLUA[] is still a null pointer.
        # Therefore, we load the function when it's invoked for the first time.
        export $fname
        function $fname($(sig...))::$(rettype(ret))
            f = get!(() -> Libdl.dlsym(LIBLUA[], $fsym), FPTRS, $fsym)
            return ccall(f, $ret, ($(ctypes...),), $(argnames...))
        end
        if $hasstate
            $fname($(sig[2:end]...)) = $fname(L[], $(argnames[2:end]...))
        end
    end
end

include(joinpath("C", "types.jl"))
include(joinpath("C", "lua.jl"))
include(joinpath("C", "aux.jl"))
include(joinpath("C", "debug.jl"))

end

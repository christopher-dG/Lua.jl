module C

const LUA = :liblua

const CTYPES = Dict(
    :Int => Cint,
    :String => Cstring,
)

const INTYPES = Dict(
    :Csize_t => UInt,
)

ctype(s::Symbol) = haskey(CTYPES, s) ? CTYPES[s] : eval(s)
ctype(ex::Expr) = ctype(ex.args[3])
intype(s::Symbol) = haskey(INTYPES, s) ? INTYPES[s] : eval(s)
intype(ex::Expr) = intype(ex.args[2])

# Input:
# @luac lua_absindex(L::LuaState, idx::Int)::Cint
# Output:
# lua_absindex(L::LuaState, idx::Int) =
#     ccall((:lua_absindex, LUA), Cint, (LuaState, Cint), L, idx)
# TODO: Passing ctypes is broken.
macro luac(ex::Expr)
    fsym = QuoteNode(ex.args[1].args[1])
    fname = esc(fsym.value)
    ret = ex.args[2]
    args = ex.args[1].args[2:end]
    argnames = map(a -> esc(a.args[1]), args)
    sig = map(((n, t),) -> :($n::$t), zip(argnames, map(a -> intype(a.args[2]), args)))
    ctypes = Tuple(map(a -> ctype(a.args[2]), args))

    quote
        export $fname
        $fname($(sig...)) = ccall(($fsym, LUA), $ret, $ctypes, $(argnames...))
    end
end

include(joinpath("C", "types.jl"))
# include(joinpath("C", "lua.jl"))
# include(joinpath("C", "aux.jl"))

end

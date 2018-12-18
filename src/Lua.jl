module Lua

const depsfile = joinpath(dirname(@__DIR__), "deps", "deps.jl")
isfile(depsfile) ? include(depsfile) : error("""Run Pkg.build("Lua")""")

include("C.jl")

using .C

const L = Ref{C.LuaState}(0)

# function __init__()
#     L[] = luaL_newstate()
#     luaL_openlibs(L[])
#     atexit(() -> lua_close(L[]))
# end

end

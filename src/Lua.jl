module Lua

include("C.jl")

using .C

# The default Lua thread.
const L = Ref{C.LuaState}(0)

function __init__()
    L[] = luaL_newstate()
    luaL_openlibs(L[])
    atexit(() -> lua_close(L[]))
end

end

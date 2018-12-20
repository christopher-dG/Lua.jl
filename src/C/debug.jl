@luac lua_gethook(L::LuaState)::LuaHook
@luac lua_gethookcount(L::LuaState)::Cint
@luac lua_gethookmask(L::LuaState)::Cint
@luac lua_getinfo(L::LuaState, what::Cstring, ar::LuaDebug)::Cint
@luac lua_getlocal(L::LuaState, ar::LuaDebug, n::Cint)::Cstring
@luac lua_getstack(L::LuaState, level::Cint, ar::LuaDebug)::Cint
@luac lua_getupvalue(L::LuaState, funcindex::Cint, n::Cint)::Cstring
@luac lua_sethook(L::LuaState, f::LuaHook, mask::Cint, count::Cint)::Cvoid
@luac lua_setlocal(L::LuaState, ar::LuaDebug, n::Cint)::Cstring
@luac lua_setupvalue(L::LuaState, funcindex::Cint, n::Cint)::Cstring
@luac lua_upvalueid(L::LuaState, funcindex::Cint, n::Cint)::Ptr{Cvoid}
@luac lua_upvaluejoin(L::LuaState, funcindex1::Cint, n1::Cint, funcindex2::Cint, n2::Cint)::Cvoid

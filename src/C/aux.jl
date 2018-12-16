# C wrapper for the Lua auxiliary library.

@luac luaL_newstate()::LuaState
@luac luaL_openlibs(L::LuaState)::Cvoid

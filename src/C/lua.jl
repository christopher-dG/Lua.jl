# C wrapper for the Lua library.

@luac lua_absindex(L::LuaState, idx::Int)::Cint
@luac lua_arith(L::LuaState, op::Int)::Cvoid
@luac lua_call(L::LuaState, nargs::Int, nresults::Int)::Cvoid
# lua_callk
@luac lua_checkstack(L::LuaState, n::Int)::Cint
@luac lua_close(L::LuaState)::Cvoid
@luac lua_compare(L::LuaState, index1::Int, index2::Int, op::Int)::Cint
@luac lua_concat(L::LuaState, n::Int)::Cvoid
@luac lua_copy(L::LuaState, fromidx::Int, toidx::Int)::Cvoid
@luac lua_createtable(L::LuaState, narr::Int, nrec::Int)::Cvoid
# lua_dump
@luac lua_error(L::LuaState)::Cint
@luac lua_gc(L::LuaState, what::Int, data::Int)::Cint
# lua_getallocf
@luac lua_getfield(L::LuaState, index::Int, k::String)::Cint
@luac lua_getextraspace(L::LuaState)::Cvoid
@luac lua_getglobal(L::LuaState, name::String)::Cint
# lua_geti
@luac lua_getmetatable(L::LuaState, index::Int)::Cint
@luac lua_gettable(L::LuaState, index::Int)::Cint
@luac lua_gettop(L::LuaState)::Cint
@luac lua_getuservalue(L::LuaState, index::Int)::Cint
@luac lua_insert(L::LuaState, index::Int)::Cint
@luac lua_isboolean(L::LuaState, index::Int)::Cint
@luac lua_iscfunction(L::LuaState, index::Int)::Cint
@luac lua_isfunction(L::LuaState, index::Int)::Cint
@luac lua_isinteger(L::LuaState, index::Int)::Cint
@luac islightuserdata(L::LuaState, index::Int)::Cint
@luac lua_isnil(L::LuaState, index::Int)::Cint
@luac lua_isnone(L::LuaState, index::Int)::Cint
@luac lua_isnoneornil(L::LuaState, index::Int)::Cint
@luac lua_isnumber(L::LuaState, index::Int)::Cint
@luac lua_isstring(L::LuaState, index::Int)::Cint
@luac lua_istable(L::LuaState, index::Int)::Cint
@luac lua_isuserdata(L::LuaState, index::Int)::Cint
@luac lua_isyieldable(L::LuaState)::Cint
@luac lua_len(L::LuaState, index::Int)::Cvoid
# lua_load
# lua_newstate
@luac lua_newtable(L::LuaState)::Cvoid
# lua_newthread
@luac lua_newuserdata(L::LuaState, size::Csize_t)::Ptr{Cvoid}
@luac lua_next(L::LuaState, index::Int)::Cint
# lua_numbertointeger
@luac lua_pcall(L::LuaState, nargs::Int, nresults::Int, msgh::Int)::Cint
# lua_pcallk
@luac lua_pop(L::LuaState, n::Int)::Cvoid
@luac lua_pushboolean(L::LuaState, b::Int)::Cvoid
# lua_pushclosure
# lua_pushcfunction
# lua_pushfstring
@luac lua_pushglobaltable(L::LuaState)::Cvoid
# lua_pushinteger
@luac lua_pushlightuserdata(L::LuaState, p::Ptr{Cvoid})::Cvoid
@luac lua_pushliteral(L::LuaState, s::String)::Cstring
@luac lua_pushlstring(L::LuaState, s::String, len::Csize_t)::Cstring
@luac lua_pushnil(L::LuaState)::Cvoid
# lua_pushnumber
@luac lua_pushstring(L::LuaState, s::String)::Cstring
@luac lua_pushthread(L::LuaState)::Cint
# lua_pushvfstring
@luac lua_rawequal(L::LuaState, index1::Int, index2::Int)::Cint
@luac lua_rawget(L::LuaState, index::Int)::Cint)
# lua_rawgeti
@luac lua_rawgetp(L::LuaState, index::Int, p::Ptr{Cvoid})
@luac lua_rawlen(L::LuaState, index::Int)::Csize_t
@luac lua_rawset(L::LuaState, index::Int)::Cvoid
# lua_rawseti
@luac lua_rawsetp(L::LuaState, index::Int, p::Ptr{Cvoid})::Cvoid
# lua_register
@luac lua_remove(L::LuaState, index::Int)::Cvoid
@luac lua_resume(L::LuaState, from::LuaState, nargs::Int)::Cint
@luac lua_rotate(L::LuaState, idx::Int, n::Int)::Cvoid
# lua_setallocf
@luac lua_setfield(L::LuaState, index::Int, k::String)::Cvoid
@luac lua_setglobal(L::LuaState, name::String)::Cvoid
# lua_seti
@luac lua_setmetatable(L::LuaState, index::Int)::Cvoid
@luac lua_setttable(L::LuaState, index::Int)::Cvoid
@luac lua_settop(L::LuaState, index::Int)::Cvoid
@luac lua_setuservalue(L::LuaState, index::Int)::Cvoid
@luac lua_status(L::LuaState)::Cint
@luac lua_stringtonumber(L::LuaState, s::String)::Csize_t
@luac lua_toboolean(L::LuaState, index::Int)::Cint
# lua_tocfunction
# lua_tointeger
# lua_tointegerx
@luac lua_tolstring(L::LuaState, index::Int, len::Ptr{Csize_t})::Cstring
# lua_tonumber
@luac lua_topointer(L::LuaState, index::Int)::Ptr{Cvoid}
@luac lua_tostring(L::LuaState, index::Int)::Cstring
@luac lua_tothread(L::LuaState, index::Int)::LuaState
@luac lua_touserdata(L::LuaState, index::Int)::Ptr{Cvoid}
@luac lua_type(L::LuaState, index::Int)::Cint
@luac lua_typename(L::LuaState, tp::Int)::Cstring
@luac lua_upvalueindex(i::Int)::Cint
# lua_version
@luac lua_xmove(from::LuaState, to::LuaState, n::Int)::Cvoid
@luac lua_yield(L::LuaState, nresults::Int)::Cint
# lua_yieldk

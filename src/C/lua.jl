# C wrapper for the Lua library.

@luac lua_absindex(L::LuaState, idx::Int)::Cint
@luac lua_arith(L::LuaState, op::Int)::Cvoid
@luac lua_atpanic(L::LuaState, panicf::LuaCFunction)::LuaCFunction
@luac lua_call(L::LuaState, nargs::Int, nresults::Int)::Cvoid
@luac lua_callk(L::LuaState, nargs::Int, nresults::Int, ctx::LuaKContext, k::LuaKFunction)::Cvoid
@luac lua_checkstack(L::LuaState, n::Int)::Cint
@luac lua_close(L::LuaState)::Cvoid
@luac lua_compare(L::LuaState, index1::Int, index2::Int, op::Int)::Cint
@luac lua_concat(L::LuaState, n::Int)::Cvoid
@luac lua_copy(L::LuaState, fromidx::Int, toidx::Int)::Cvoid
@luac lua_createtable(L::LuaState, narr::Int, nrec::Int)::Cvoid
@luac lua_dump(L::LuaState, writer::LuaWriter, data::Ptr{Cvoid}, strip::Int)::Cint
@luac lua_error(L::LuaState)::Cint
@luac lua_gc(L::LuaState, what::Int, data::Int)::Cint
@luac lua_getallocf(L::LuaState, ud::Ptr{Ptr{Cvoid}})::LuaAlloc
@luac lua_getfield(L::LuaState, index::Int, k::String)::Cint
@luac lua_getextraspace(L::LuaState)::Cvoid
@luac lua_getglobal(L::LuaState, name::String)::Cint
@luac lua_geti(L::LuaState, index::Int, i::LuaInteger)::Cint
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
@luac lua_load(L::LuaState, reader::LuaReader, data::Ptr{Cvoid}, chunkname::String, mode::String)::Cint
@Luac lua_newstate(f::LuaAlloc, ud::Ptr{Cvoid})::LuaState
@luac lua_newtable(L::LuaState)::Cvoid
@luac lua_newthread(L::LuaState)::LuaState
@luac lua_newuserdata(L::LuaState, size::Csize_t)::Ptr{Cvoid}
@luac lua_next(L::LuaState, index::Int)::Cint
@luac lua_numbertointeger(n::LuaNumber, p::Ptr{LuaInteger})::Cint
@luac lua_pcall(L::LuaState, nargs::Int, nresults::Int, msgh::Int)::Cint
@luac lua_pcallk(L::LuaState, nargs::Int, nresults::Int, msgh::Int, ctx::LuaKContext, k::LuaKFunction)::Cint
@luac lua_pop(L::LuaState, n::Int)::Cvoid
@luac lua_pushboolean(L::LuaState, b::Int)::Cvoid
@luac lua_pushclosure(L::LuaState, fn::LuaCFunction, n::Int)::Cvoid
@luac lua_pushcfunction(L::LuaState, f::LuaCFunction)::Cvoid
# TODO: lua_pushfstring
@luac lua_pushglobaltable(L::LuaState)::Cvoid
@luac lua_pushinteger(L::LuaState, n::LuaInteger)::Cvoid
@luac lua_pushlightuserdata(L::LuaState, p::Ptr{Cvoid})::Cvoid
@luac lua_pushliteral(L::LuaState, s::String)::Cstring
@luac lua_pushlstring(L::LuaState, s::String, len::Csize_t)::Cstring
@luac lua_pushnil(L::LuaState)::Cvoid
@luac lua_pushnumber(L::LuaState, n::LuaNumber)::Cvoid
@luac lua_pushstring(L::LuaState, s::String)::Cstring
@luac lua_pushthread(L::LuaState)::Cint
# TODO: lua_pushvfstring
@luac lua_rawequal(L::LuaState, index1::Int, index2::Int)::Cint
@luac lua_rawget(L::LuaState, index::Int)::Cint)
@luac lua_rawgeti(L::LuaState, n::LuaInteger)::Cint
@luac lua_rawgetp(L::LuaState, index::Int, p::Ptr{Cvoid})
@luac lua_rawlen(L::LuaState, index::Int)::Csize_t
@luac lua_rawset(L::LuaState, index::Int)::Cvoid
@luac lua_rawseti(L::LuaState, index::Int, i::LuaInteger)::Cvoid
@luac lua_rawsetp(L::LuaState, index::Int, p::Ptr{Cvoid})::Cvoid
@luac lua_register(L::LuaState, name::String, f::LuaCFunction)::Cvoid
@luac lua_remove(L::LuaState, index::Int)::Cvoid
@luac lua_resume(L::LuaState, from::LuaState, nargs::Int)::Cint
@luac lua_rotate(L::LuaState, idx::Int, n::Int)::Cvoid
@luac lua_setallocf(L::LuaState, f::LuaAlloc, ud::Ptr{Cvoid})::Cvoid
@luac lua_setfield(L::LuaState, index::Int, k::String)::Cvoid
@luac lua_setglobal(L::LuaState, name::String)::Cvoid
@luac lua_seti(L::LuaState, index::Int, n::LuaInteger)::Cvoid
@luac lua_setmetatable(L::LuaState, index::Int)::Cvoid
@luac lua_setttable(L::LuaState, index::Int)::Cvoid
@luac lua_settop(L::LuaState, index::Int)::Cvoid
@luac lua_setuservalue(L::LuaState, index::Int)::Cvoid
@luac lua_status(L::LuaState)::Cint
@luac lua_stringtonumber(L::LuaState, s::String)::Csize_t
@luac lua_toboolean(L::LuaState, index::Int)::Cint
@luac lua_tocfunction(L::LuaState, index::Int)::LuaCFunction
@luac lua_tointeger(L::LuaState, index::Int)::LuaInteger
@luac lua_tointegerx(L::LuaState, index::Int, isnum::Ptr{Int})::LuaInteger
@luac lua_tolstring(L::LuaState, index::Int, len::Ptr{Csize_t})::Cstring
@luac lua_tonumber(L::LuaState, index::Int)::LuaNumber
@luac lua_tonumberx(L::LuaState, index::Int, isnum::Ptr{Int})::LuaNumber
@luac lua_topointer(L::LuaState, index::Int)::Ptr{Cvoid}
@luac lua_tostring(L::LuaState, index::Int)::Cstring
@luac lua_tothread(L::LuaState, index::Int)::LuaState
@luac lua_touserdata(L::LuaState, index::Int)::Ptr{Cvoid}
@luac lua_type(L::LuaState, index::Int)::Cint
@luac lua_typename(L::LuaState, tp::Int)::Cstring
@luac lua_upvalueindex(i::Int)::Cint
@luac lua_version(L::LuaState)::Ptr{LuaNumber}
@luac lua_xmove(from::LuaState, to::LuaState, n::Int)::Cvoid
@luac lua_yield(L::LuaState, nresults::Int)::Cint
@luac lua_yieldk(L::LuaState, nresults::Int, ctx::LuaKContext, k::LuaKFunction)::Cint

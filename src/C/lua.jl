# C wrapper for the Lua library.

# Manual overrides: These are necessary because some C functions are defined with macros.

export lua_call, lua_insert, lua_isboolean, lua_isfunction, lua_islightuserdata, lua_isnil,
    lua_isnone, lua_isnoneornil, lua_istable, lua_newtable, lua_numbertointeger, lua_pcall,
    lua_pop, lua_pushcfunction, lua_pushglobaltable, lua_pushliteral, lua_register,
    lua_remove, lua_tointeger, lua_tonumber, lua_tostring, lua_upvalueindex, lua_yield

lua_call(L::LuaState, nargs::Integer, nresults::Integer) =
    lua_callk(L, nargs, nresults, 0, nullptr(Cvoid))
lua_call(nargs::Integer, nresults::Integer) = lua_call(L[], nargs, nresults)
lua_getextraspace(L::LuaState) = Ptr{Cvoid}(UInt(L) - LUA_EXTRASPACE)
lua_getextraspace() = lua_getextraspace(L[])
lua_insert(L::LuaState, idx::Integer) = lua_rotate(L, idx, 1)
lua_insert(idx::Integer) = lua_insert(L[], idx)
lua_isboolean(L::LuaState, index::Integer)::Int = lua_type(L, index) == LUA_TBOOLEAN
lua_isboolean(index::Integer) = lua_isboolean(L[], index)
lua_isfunction(L::LuaState, index::Integer)::Int = lua_type(L, index) == LUA_TFUNCTION
lua_isfunction(index::Integer) = lua_isfunction(L[], index)
lua_islightuserdata(L::LuaState, index::Integer)::Int =
    lua_type(L, index) == LUA_TLIGHTUSERDATA
lua_islightuserdata(index::Integer) = lua_islightuserdata(L[], index)
lua_isnil(L::LuaState, index::Integer)::Int = lua_type(L, index) == LUA_TNIL
lua_isnil(index::Integer) = lua_isnil(L[], index)
lua_isnone(L::LuaState, index::Integer)::Int = lua_type(L, index) == LUA_TNONE
lua_isnone(index::Integer) = lua_isnone(L[], index)
lua_isnoneornil(L::LuaState, index::Integer)::Int = lua_type(L, index) <= LUA_TNIL
lua_isnoneornil(index::Integer) = lua_isnoneornil(L[], index)
lua_istable(L::LuaState, index::Integer)::Int = lua_type(L, index) == LUA_TTABLE
lua_istable(index::Integer) = lua_istable(L[], index)
lua_newtable(L::LuaState) = lua_createtable(L, 0, 0)
lua_newtable() = lua_newtable(L[])
lua_numbertointeger(n::LuaNumber, p::Ptr{LuaInteger}) =
    typemin(Cint) <= n <= typemax(Cint) ? (unsafe_store!(p, round(LuaInteger, n)); 1) : 0
pcall(L::LuaState, nargs::Integer, nresults::Integer, msgh::Integer) =
    lua_pcallk(L, nargs, nresults, msgh, 0, nullptr(Cvoid))
lua_pcall(nargs::Integer, nresults::Integer, msgh::Integer) =
    lua_pcall(L[], nargs, nresults, msgh)
lua_pop(L::LuaState, n::Integer) = lua_settop(L, -n - 1)
lua_pop(n::Integer) = lua_pop(L[], n)
lua_pushcfunction(L::LuaState, f::LuaCFunction) = lua_pushcclosure(L, f, 0)
lua_pushcfunction(f::LuaCFunction) = lua_pushcfunction(L[], f)
lua_pushglobaltable(L::LuaState) =
    (lua_rawgeti(L, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS); Cvoid())
lua_pushglobaltable() = lua_pushglobaltable(L[])
lua_pushliteral(L::LuaState, s::String) = lua_pushstring(L, s)
lua_pushliteral(s::String) = lua_pushliteral(L[], s)
lua_register(L::LuaState, name::String, f::LuaCFunction) =
    (lua_pushcfunction(L, f); lua_setglobal(L, name))
lua_register(name::String, f::LuaCFunction) = lua_register(L[], name, f)
lua_remove(L::LuaState, index::Integer) = (lua_rotate(L, idx, -1); lua_pop(L, 1))
lua_remove(index::Integer) = lua_remove(L[], index)
lua_tointeger(L::LuaState, index::Integer) = lua_tointegerx(L, index, nullptr(Cint))
lua_tointeger(index::Integer) = lua_tointeger(L[], index)
lua_tonumber(L::LuaState, index::Integer) = lua_numberx(L, index, nullptr(Cint))
lua_tonumber(index::Integer) = lua_tonumber(L[], index)
lua_tostring(L::LuaState, index::Integer) = lua_tolstring(L, index, nullptr(Csize_t))
lua_tostring(index::Integer) = lua_tostring(L[], index)
lua_upvalueindex(i::Integer) = LUA_REGISTRYINDEX - i
lua_yield(L::LuaState, nresults::Integer) = lua_yieldk(L, nresults, 0, nullptr(Cvoid))
lua_yield(nresults::Integer) = lua_yield(L[], nresults)

# Regular generated ccall wrappers.

@luac lua_absindex(L::LuaState, idx::Cint)::Cint
@luac lua_arith(L::LuaState, op::Cint)::Cvoid
@luac lua_atpanic(L::LuaState, panicf::LuaCFunction)::LuaCFunction
@luac lua_callk(L::LuaState, nargs::Cint, nresults::Cint, ctx::LuaKContext, k::LuaKFunction)::Cvoid
@luac lua_checkstack(L::LuaState, n::Cint)::Cint
@luac lua_close(L::LuaState)::Cvoid
@luac lua_compare(L::LuaState, index1::Cint, index2::Cint, op::Cint)::Cint
@luac lua_concat(L::LuaState, n::Cint)::Cvoid
@luac lua_copy(L::LuaState, fromidx::Cint, toidx::Cint)::Cvoid
@luac lua_createtable(L::LuaState, narr::Cint, nrec::Cint)::Cvoid
@luac lua_dump(L::LuaState, writer::LuaWriter, data::Ptr{Cvoid}, strip::Cint)::Cint
@luac lua_error(L::LuaState)::Cint
@luac lua_gc(L::LuaState, what::Cint, data::Cint)::Cint
@luac lua_getallocf(L::LuaState, ud::Ptr{Ptr{Cvoid}})::LuaAlloc
@luac lua_getfield(L::LuaState, index::Cint, k::Cstring)::Cint
@luac lua_getglobal(L::LuaState, name::Cstring)::Cint
@luac lua_geti(L::LuaState, index::Cint, i::LuaInteger)::Cint
@luac lua_getmetatable(L::LuaState, index::Cint)::Cint
@luac lua_gettable(L::LuaState, index::Cint)::Cint
@luac lua_gettop(L::LuaState)::Cint
@luac lua_getuservalue(L::LuaState, index::Cint)::Cint
@luac lua_iscfunction(L::LuaState, index::Cint)::Cint
@luac lua_isinteger(L::LuaState, index::Cint)::Cint
@luac lua_isnumber(L::LuaState, index::Cint)::Cint
@luac lua_isstring(L::LuaState, index::Cint)::Cint
@luac lua_isuserdata(L::LuaState, index::Cint)::Cint
@luac lua_isyieldable(L::LuaState)::Cint
@luac lua_len(L::LuaState, index::Cint)::Cvoid
@luac lua_load(L::LuaState, reader::LuaReader, data::Ptr{Cvoid}, chunkname::Cstring, mode::Cstring)::Cint
@luac lua_newstate(f::LuaAlloc, ud::Ptr{Cvoid})::LuaState
@luac lua_newthread(L::LuaState)::LuaState
@luac lua_newuserdata(L::LuaState, size::Csize_t)::Ptr{Cvoid}
@luac lua_next(L::LuaState, index::Cint)::Cint
@luac lua_pcallk(L::LuaState, nargs::Cint, nresults::Cint, msgh::Cint, ctx::LuaKContext, k::LuaKFunction)::Cint
@luac lua_pushboolean(L::LuaState, b::Cint)::Cvoid
@luac lua_pushcclosure(L::LuaState, fn::LuaCFunction, n::Cint)::Cvoid
# TODO: lua_pushfstring
@luac lua_pushinteger(L::LuaState, n::LuaInteger)::Cvoid
@luac lua_pushlightuserdata(L::LuaState, p::Ptr{Cvoid})::Cvoid
@luac lua_pushlstring(L::LuaState, s::Cstring, len::Csize_t)::Cstring
@luac lua_pushnil(L::LuaState)::Cvoid
@luac lua_pushnumber(L::LuaState, n::LuaNumber)::Cvoid
@luac lua_pushstring(L::LuaState, s::Cstring)::Cstring
@luac lua_pushthread(L::LuaState)::Cint
# TODO: lua_pushvfstring
@luac lua_rawequal(L::LuaState, index1::Cint, index2::Cint)::Cint
@luac lua_rawget(L::LuaState, index::Cint)::Cint
@luac lua_rawgeti(L::LuaState, n::LuaInteger)::Cint
@luac lua_rawgetp(L::LuaState, index::Cint, p::Ptr{Cvoid})::Cint
@luac lua_rawlen(L::LuaState, index::Cint)::Csize_t
@luac lua_rawset(L::LuaState, index::Cint)::Cvoid
@luac lua_rawseti(L::LuaState, index::Cint, i::LuaInteger)::Cvoid
@luac lua_rawsetp(L::LuaState, index::Cint, p::Ptr{Cvoid})::Cvoid
@luac lua_resume(L::LuaState, from::LuaState, nargs::Cint)::Cint
@luac lua_rotate(L::LuaState, idx::Cint, n::Cint)::Cvoid
@luac lua_setallocf(L::LuaState, f::LuaAlloc, ud::Ptr{Cvoid})::Cvoid
@luac lua_setfield(L::LuaState, index::Cint, k::Cstring)::Cvoid
@luac lua_setglobal(L::LuaState, name::Cstring)::Cvoid
@luac lua_seti(L::LuaState, index::Cint, n::LuaInteger)::Cvoid
@luac lua_setmetatable(L::LuaState, index::Cint)::Cvoid
@luac lua_settable(L::LuaState, index::Cint)::Cvoid
@luac lua_settop(L::LuaState, index::Cint)::Cvoid
@luac lua_setuservalue(L::LuaState, index::Cint)::Cvoid
@luac lua_status(L::LuaState)::Cint
@luac lua_stringtonumber(L::LuaState, s::Cstring)::Csize_t
@luac lua_toboolean(L::LuaState, index::Cint)::Cint
@luac lua_tocfunction(L::LuaState, index::Cint)::LuaCFunction
@luac lua_tointegerx(L::LuaState, index::Cint, isnum::Ptr{Cint})::LuaInteger
@luac lua_tolstring(L::LuaState, index::Cint, len::Ptr{Csize_t})::Cstring
@luac lua_tonumberx(L::LuaState, index::Cint, isnum::Ptr{Cint})::LuaNumber
@luac lua_topointer(L::LuaState, index::Cint)::Ptr{Cvoid}
@luac lua_tothread(L::LuaState, index::Cint)::LuaState
@luac lua_touserdata(L::LuaState, index::Cint)::Ptr{Cvoid}
@luac lua_type(L::LuaState, index::Cint)::Cint
@luac lua_typename(L::LuaState, tp::Cint)::Cstring
@luac lua_version(L::LuaState)::Ptr{LuaNumber}
@luac lua_xmove(from::LuaState, to::LuaState, n::Cint)::Cvoid
@luac lua_yieldk(L::LuaState, nresults::Cint, ctx::LuaKContext, k::LuaKFunction)::Cint

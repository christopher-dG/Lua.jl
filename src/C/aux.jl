# C wrapper for the Lua auxiliary library.

# Note for later: null string is Cstring(C_NULL).

@luac luaL_addchar(B::LuaLBuffer, c::Cchar)::Cvoid
@luac luaL_addlstring(B::LuaLBuffer, s::Cstring, l::Csize_t)::Cvoid
@luac luaL_addsize(B::LuaLBuffer, n::Csize_t)::Cvoid
@luac luaL_addstring(B::LuaLBuffer, s::Cstring)::Cvoid
@luac luaL_addvalue(B::LuaLBuffer)::Cvoid
@luac luaL_argcheck(L::LuaState, cond::Cint, arg::Cint, extramsg::Cstring)::Cvoid
@luac luaL_argerror(L::LuaState, arg::Cint, extramsg::Cstring)::Cint
@luac luaL_buffinit(L::LuaState, B::LuaLBuffer)::Cvoid
@luac luaL_buffinitsize(L::LuaState, B::LuaLBuffer, sz::Csize_t)::Cchar
@luac luaL_callmeta(L::LuaState, obj::Cint, e::Cstring)::Cint
@luac luaL_checkany(L::LuaState, arg::Cint)::Cvoid
@luac luaL_checkinteger(L::LuaState, arg::Cint)::LuaInteger
@luac luaL_checklstring(L::LuaState, arg::Cint, l::Ptr{Csize_t})::Cstring
@luac luaL_checknumber(L::LuaState, arg::Cint)::LuaNumber
# TODO: luaL_checkoption
@luac luaL_checkstack(L::LuaState, sz::Cint, msg::Cstring)::Cvoid
@luac luaL_checkstring(L::LuaState, arg::Cint)::Cstring
@luac luaL_checktype(L::LuaState, arg::Cint, t::Cint)::Cvoid
@luac luaL_checkudata(L::LuaState, arg::Cint, tname::Cstring)::Ptr{Cvoid}
@luac luaL_checkversion(L::LuaState)::Cvoid
@luac luaL_dofile(L::LuaState, filename::Cstring)::Cint
@luac luaL_dostring(L::LuaState, str::Cstring)::Cint
# TODO: luaL_error
@luac luaL_execresult(L::LuaState, stat::Cint)::Cint
@luac luaL_fileresult(L::LuaState, stat::Cint, fname::Cstring)::Cint
@luac luaL_getmetafield(L::LuaState, obj::Cint, e::Cstring)::Cint
@luac luaL_getmetatable(L::LuaState, tname::Cstring)::Cint
@luac luaL_getsubtable(L::LuaState, idx::Cint, fname::Cstring)::Cint
@luac luaL_gsub(L::LuaState, s::Cstring, p::Cstring, r::Cstring)::Cstring
@luac luaL_len(L::LuaState, index::Cint)::LuaInteger
@luac luaL_loadbuffer(L::LuaState, buff::Cstring, sz::Csize_t, name::Cstring)::Cint
@luac luaL_loadbufferx(L::LuaState, buff::Cstring, sz::Csize_t, name::Cstring, mode::Cstring)::Cint
@luac luaL_loadfile(L::LuaState, filename::Cstring)::Cint
@luac luaL_loadfilex(L::LuaState, filename::Cstring, mode::Cstring)::Cint
@luac luaL_loadstring(L::LuaState, s::Cstring)::Cint
@luac luaL_loadstringx(L::LuaState, s::Cstring, mode::Cstring)::Cint
# TODO: luaL_newlib
# TODO: luaL_newlibtable
@luac luaL_newmetatable(L::LuaState, tname::Cstring)::Cint
@luac luaL_newstate()::LuaState
@luac luaL_openlibs(L::LuaState)::Cvoid
# TODO: luaL_opt (macro)
@luac luaL_optinteger(L::LuaState, arg::Cint, d::LuaInteger)::LuaInteger
@luac luaL_optlstring(L::LuaState, arg::Cint, d::Cstring, l::Ptr{Csize_t})::Cstring
@luac luaL_optnumber(L::LuaState, arg::Cint, d::LuaNumber)::LuaNumber
@luac luaL_optstring(L::LuaState, arg::Cint, d::Cstring)::Cstring
@luac luaL_prepbuffer(B::LuaLBuffer)::Cstring
@luac luaL_prepbuffsize(B::LuaLBuffer, sz::Csize_t)::Cstring
@luac luaL_pushresult(B::LuaLBuffer)::Cvoid
@luac luaL_pushresultsize(B::LuaLBuffer, sz::Csize_t)::Cvoid
@luac luaL_ref(L::LuaState, t::Cint)::Cint
@luac luaL_requiref(L::LuaState, modname::Cstring, openf::LuaCFunction, glb::Cint)::Cvoid
# TODO: luaL_setfuncs
@luac luaL_setmetatable(L::LuaState, tname::Cstring)::Cvoid
@luac luaL_testudata(L::LuaState, arg::Cint, tname::Cstring)::Cvoid
@luac luaL_tolstring(L::LuaState, idx::Cint, len::Ptr{Csize_t})::Cstring
@luac luaL_traceback(L::LuaState, L1::LuaState, msg::Cstring, level::Cint)::Cvoid
@luac luaL_typename(L::LuaState, index::Cint)::Cstring
@luac luaL_unref(L::LuaState, ref::Cint)::Cvoid
@luac luaL_where(L::LuaState, lvl::Cint)::Cvoid

# C wrapper for the Lua auxiliary library.

# Manual overrides: These are necessary because some C functions are defined with macros.

export luaL_argcheck, luaL_checkstring, luaL_checkversion, luaL_dofile, luaL_dostring,
    luaL_getmetatable, luaL_loadbuffer, luaL_loadfile, luaL_optstring, luaL_prepbuffer,
    luaL_typename

# TODO: luaL_addchar(B::LuaLBuffer, c::Cchar)::Cvoid
# TODO: luaL_addsize(B::LuaLBuffer, n::Csize_t)::Cvoid
luaL_argcheck(L::LuaState, cond::Integer, arg::Integer, extramsg::Str) =
    (cond == 1 || luaL_argerror(L, arg. extramsg); Cvoid())
luaL_argcheck(cond::Integer, arg::Integer, extramsg::Str) =
    luaL_argcheck(L[], cond, arg, extramsg)
luaL_checkstring(L::LuaState, arg::Integer) = luaL_checklstring(L, n, nullptr(Csize_t))
luaL_checkstring(arg::Integer) = luaL_checkstring(L[], arg)
luaL_checkversion(L::LuaState) =
    ccall(get!(() -> Libdl.dlsym(LIBLUA, :luaL_checkversion_), FPTRS, :luaL_checkversion_),
          Cvoid, (LuaState, LuaNumber, Csize_t), L, LUA_VERSION_NUM, LUAL_NUMSIZES)
luaL_checkversion() = luaL_checkversion(L[])
luaL_dofile(L::LuaState, filename::Str)::Cint =
    luaL_loadfile(L, filename) == 1 || lua_pcall(L, 0, LUA_MULTRET, 0)
luaL_dofile(filename::Str) = luaL_dofile(L[], filename)
luaL_dostring(L::LuaState, str::Str)::Cint =
    luaL_loadstring(L, str) == 1 || lua_pcall(L, 0, LUA_MULTRET, 0)
luaL_dostring(str::Str)::Cint = luaL_dostring(L[], str)
luaL_getmetatable(L::LuaState, tname::Str) = lua_getfield(L, LUA_REGISTRYINDEX, tname)
luaL_getmetatable(tname::Str) = luaL_getmetatable(L[], tname)
luaL_loadbuffer(L::LuaState, buff::Str, sz::Integer, name::Str) =
    luaL_loadbufferx(L, buff, sz, Cstring(C_NULL))
luaL_loadbuffer(buff::Str, sz::Integer, name::Str) = luaL_loadbuffer(L[], buff, sz, name)
luaL_loadfile(L::LuaState, filename::Str) = luaL_loadfilex(L, filename, Cstring(C_NULL))
luaL_loadfile(filename::Str) = luaL_loadfile(L[], filename)
luaL_optstring(L::LuaState, arg::Integer, d::Str) =
    luaL_optlstring(L, arg, d, nullptr(Csize_t))
luaL_optstring(arg::Integer, d::Str) = luaL_optstring(L[], arg, d)
luaL_prepbuffer(B::LuaLBuffer) = luaL_prepbuffsize(B, LUAL_BUFFERSIZE)
luaL_typename(L::LuaState, index::Integer) = lua_typename(L, lua_type(L, index))
luaL_typename(index::Integer) = luaL_typename(L[], index)

# Regular generated ccall wrappers.

@luac luaL_addlstring(B::LuaLBuffer, s::Cstring, l::Csize_t)::Cvoid
@luac luaL_addstring(B::LuaLBuffer, s::Cstring)::Cvoid
@luac luaL_addvalue(B::LuaLBuffer)::Cvoid
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
@luac luaL_checktype(L::LuaState, arg::Cint, t::Cint)::Cvoid
@luac luaL_checkudata(L::LuaState, arg::Cint, tname::Cstring)::Ptr{Cvoid}
# TODO: luaL_error
@luac luaL_execresult(L::LuaState, stat::Cint)::Cint
@luac luaL_fileresult(L::LuaState, stat::Cint, fname::Cstring)::Cint
@luac luaL_getmetafield(L::LuaState, obj::Cint, e::Cstring)::Cint
@luac luaL_getsubtable(L::LuaState, idx::Cint, fname::Cstring)::Cint
@luac luaL_gsub(L::LuaState, s::Cstring, p::Cstring, r::Cstring)::Cstring
@luac luaL_len(L::LuaState, index::Cint)::LuaInteger
@luac luaL_loadbufferx(L::LuaState, buff::Cstring, sz::Csize_t, name::Cstring, mode::Cstring)::Cint
@luac luaL_loadfilex(L::LuaState, filename::Cstring, mode::Cstring)::Cint
@luac luaL_loadstring(L::LuaState, s::Cstring)::Cint
# TODO: luaL_newlib
# TODO: luaL_newlibtable
@luac luaL_newmetatable(L::LuaState, tname::Cstring)::Cint
@luac luaL_newstate()::LuaState
@luac luaL_openlibs(L::LuaState)::Cvoid
# TODO: luaL_opt (macro)
@luac luaL_optinteger(L::LuaState, arg::Cint, d::LuaInteger)::LuaInteger
@luac luaL_optlstring(L::LuaState, arg::Cint, d::Cstring, l::Ptr{Csize_t})::Cstring
@luac luaL_optnumber(L::LuaState, arg::Cint, d::LuaNumber)::LuaNumber
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
@luac luaL_unref(L::LuaState, ref::Cint)::Cvoid
@luac luaL_where(L::LuaState, lvl::Cint)::Cvoid

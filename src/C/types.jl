nullptr(::Type{T}) where T = Ptr{T}(0)

struct LuaAlloc
    ud::Ptr{Cvoid}
    ptr::Ptr{Cvoid}
    osize::Csize_t
    nsize::Csize_t
end

# TODO: Generate some of these from the Lua headers.

const LuaCFunction = Union{Ptr{Cvoid}, Base.CFunction}
const LuaInteger = Clonglong
const LuaKContext = Cint  # This is intptr_t.
const LuaKFunction = Union{Ptr{Cvoid}, Base.CFunction}
const LuaNumber = Cdouble
const LuaReader = Union{Ptr{Cvoid}, Base.CFunction}
const LuaUnsigned = Culonglong
const LuaWriter = Union{Ptr{Cvoid}, Base.CFunction}

mutable struct _LuaLBuffer end
const LuaLBuffer = Ptr{_LuaLBuffer}

struct LuaLReg
    name::Cstring
    func::LuaCFunction
end

struct _CFile end
const CFile = Ptr{_CFile}

struct LuaLStream
    f::CFile
    closef::LuaCFunction
end

mutable struct _LuaDebug
    event::Cint
    name::Cstring
    namewhat::Cstring
    source::Cstring
    currentline::Cint
    linedefined::Cint
    lastlinedefined::Cint
    nups::Cuchar
    nparams::Cuchar
    isvararg::Cchar
    istailcall::Cchar
    short_src::NTuple{LUA_IDSIZE, Cchar}
    _LuaDebug() = new()
end
const LuaDebug = Ref{_LuaDebug}
LuaDebug() = Ref(_LuaDebug())

const LuaHook = Union{Ptr{Cvoid}, Base.CFunction}

luacfunction(f::Function) = @cfunction $f Cint (LuaState,)
luakfunction(f::Function) = @cfunction $f Cint (LuaState, Cint, LuaKContext)
luareader(f::Function) = @cfunction $f Cstring (LuaState, Ptr{Cvoid}, Ptr{Csize_t})
luawriter(f::Function) = @cfunction $f Cint (LuaState, Ptr{Cvoid}, Csize_t, Ptr{Cvoid})
luahook(f::Function) = @cfunction $f Cvoid (LuaState, LuaDebug)

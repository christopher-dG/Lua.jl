struct LuaAlloc
    ud::Ptr{Cvoid}
    ptr::Ptr{Cvoid}
    osize::Csize_t
    nsize::Csize_t
end

const LuaCFunction = Ptr{Cvoid}
const LuaInteger = Clonglong
const LuaKContext = Cint  # This is intptr_t.
const LuaKFunction = Ptr{Cvoid}
const LuaNumber = Cdouble
const LuaReader = Ptr{Cvoid}
const LuaUnsigned = Culonglong
const LuaWriter = Ptr{Cvoid}

nullptr(::Type{T}) where T = Ptr{T}(0)

macro luacfunction(f::Symbol)
    @eval @cfunction f Cint (LuaState,)
end
macro luakcfunction(f::Symbol)
    @eval @cfunction $f Cint (LuaState, Cint, LuaKContext)
end
macro luareader(f::Symbol)
    @eval @cfunction eval(f) Cstring (LuaState, Ptr{Cvoid}, Ptr{Csize_t})
end
macro luawriter(f::Symbol)
    @eval @cfunction $f Cint (LuaState, Ptr{Cvoid}, Csize_t, Ptr{Cvoid})
end

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

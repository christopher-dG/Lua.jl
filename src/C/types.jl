mutable struct _LuaState end
const LuaState = Ptr{_LuaState}

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

mutable struct _LuaLBuffer end
const LuaLBuffer = Ptr{_LuaLBuffer}

nullptr(::Type{T}) where T = Ptr{T}(0)

macro luacfunction(f::Symbol)
    @cfunction $f Cint (LuaState,)
end
macro luakcfunction(f::Symbol)
    @cfunction $f Cint (LuaState, Cint, LuaKContext)
end
macro luareader(f::Symbol)
    @cfunction $f Cstring (LuaState, Ptr{Cvoid}, Ptr{Csize_t})
end
macro luawriter(f::Symbol)
    @cfunction $f Cint (LuaState, Ptr{Cvoid}, Csize_t, Ptr{Cvoid})
end

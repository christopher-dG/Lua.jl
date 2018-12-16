mutable struct _LuaState end
const LuaState = Ptr{_LuaState}

struct LuaAlloc
    ud::Ptr{Cvoid}
    ptr::Ptr{Cvoid}
    osize::Csize_t
    nsize::Csize_t
end

# TODO: Most types which use this have signature constraints,
# but there's no way to represent that.
const CFunction = Ptr{Cvoid}

const LuaCFunction = CFunction
const LuaInteger = Clonglong
const LuaKContext = Ptr{Cint}  # TODO: Check correctness (this is intptr_t).
const LuaKFunction = CFunction
const LuaNumber = Cdouble
const LuaReader = CFunction
const LuaUnsigned = Culonglong
const LuaWriter = CFunction

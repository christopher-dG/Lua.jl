module Lua

export setluastate!, @lua_str, @luastruct

struct _LuaState end
const LuaState = Ptr{_LuaState}

# The default Lua thread.
const L = Ref{LuaState}(0)

include("C.jl")
using .C

function __init__()
    L[] = luaL_newstate()
    luaL_openlibs()
    atexit(lua_close)
end

"""
    setluastate!(new_L::LuaState) -> LuaState

Set the default Lua thread. The previous default is returned.
"""
function setluastate!(new_L::LuaState)
    old_L = L[]
    L[] = new_L
    return old_L
end

# Alphanumeric + underscores, with no leading digit.
const LUA_VAR = r"\$([a-zA-Z_][\w]+)"

"""
    @lua_str -> Any

Evaluate some Lua code. Variables interpolated with `\$` are made into local Lua variables.

## Examples
```jldoctest; setup=:(using Lua)
julia> lua"print(1)";
1

julia> x = 1; lua"print(\$x)";
1
```
"""
macro lua_str(s)
    quote
        vars = IOBuffer()
        for m in eachmatch(LUA_VAR, $s)
            name = m[1]
            value = luaval(nothing)  # TODO: How to get the variable value by name?
            println(vars, "local $name = $value")
        end

        code = String(take!(vars)) * replace($s, '$' => "")
        # TODO: Run the code and get the result.
    end
end

"""
    @luastruct T

Enable converting structs of type `T` into Lua variables.

## Example
```jldoctest; setup=:(using Lua)
julia> struct Foo a; b; c; end

julia> @luastruct Foo

julia> println(Lua.luaval(Foo(nothing, "bar", 1)))
{a=nil,b="bar",c=1}
```
"""
macro luastruct(T::Symbol)
    quote
        if !isstructtype($(esc(T)))
            throw(ArgumentError("@luatype can only be used on structs"))
        end

        function Lua.luaval(x::$(esc(T)))
            vals = map(n -> string(n, "=", luaval(getfield(x, n))), propertynames(x))
            return string("{", join(vals, ','), "}")
        end
    end
end

luakey(x) = luaval(x)
luakey(x::Symbol) = string(x)
luakey(x::AbstractString) = x

# Returns an inline value, and a NamedTuple of the non-inlined keys/values.
luaval(x) = error("Can't convert $(typeof(x)) to Lua value")
luaval(x::AbstractString) = repr(x)
luaval(::Nothing) = "nil"
luaval(x::Union{Bool, Real}) = string(x)
luaval(x::Union{AbstractArray, Tuple}) = string("{", join(map(luaval, x), ','), "}")
function luaval(x::Union{AbstractDict, NamedTuple})
    if any(p -> p.first isa Number, pairs(x))
        error("Can't convert $(typeof(x)) with numeric keys to Lua value")
    end
    vals = [string(luakey(p.first), "=", luaval(p.second)) for p in pairs(x)]
    return string("{", join(vals, ','), "}")
end

end

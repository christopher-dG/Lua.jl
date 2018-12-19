module Lua

export @lua_str, @luatype

include("C.jl")

using .C

# The default Lua thread.
const L = Ref{C.LuaState}(0)

function __init__()
    L[] = luaL_newstate()
    luaL_openlibs(L[])
    atexit(() -> lua_close(L[]))
end

const LUA_VAR = r"\$([^\d][\w]+)"

"""
    @lua_str -> Any

Evaluate some Lua code. Variables interpolated with `\$` are made into local Lua variables.

## Examples
```jldoctest
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
    @luatype T

Enable converting variables of type `T` into Lua variables.
"""
macro luatype(T::Symbol)
    quote
        function Lua.luaval(x::$(esc(T)))
            vals = map(n -> string(n, "=", luavar(getfield(x, n))), propertynames(x))
            return string("{", join(vals, ','), "}")
        end
    end
end

luakey(x) = luavar(x)
luakey(x::AbstractString) = x

luaval(x) = error("Can't convert $(typeof(x)) to Lua value")
luaval(x::AbstractString) = repr(x)
luaval(::Nothing) = "nil"
luaval(x::Union{Bool, Number}) = string(x)
luaval(x::AbstractArray) = string("{", join(map(luavar, x), ','), "}")
function luaval(x::AbstractDict)
    vals = [string(luakey(p.first), "=", luaval(p.second)) for p in x]
    return string("{", join(vals, ','), "}")
end

end

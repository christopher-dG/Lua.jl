# TODO: Proper Lua install management.

using Libdl

Sys.isunix() || error("Only Unix systems are supported")c

const includes = ["/usr/include/lua", "/usr/include/lua5.3",
                  "/usr/local/include/lua", "/usr/local/include/lua5.3"]
if Sys.isapple()
    try
        dir = first(split(readchomp(pipeline(`brew info lua`, `grep '^/.*/lua'`))))
        push!(includes, joinpath(dir, "include", "lua"), joinpath(dir, "include", "lua5.3"))
    catch
    end
end
map!(d -> "-I$d", includes, includes)
println(includes)

# Compile and run a C program.
function runc(program::String)
    run(`gcc $program.c -o $program $includes -llua5.3`)
    return readchomp(`./$program`)
end

# Check the installed Lua version.
v = try runc("lua_version") catch _ "" end
v == "503" || error("Lua version 5.3 is required")

# Get the Lua constants.
consts = runc("lua_consts")

# Get the shared library path. This is super gross.
liblua = nothing
if Libdl.dlopen_e(:liblua) !== C_NULL
    liblua = :liblua
elseif Sys.isapple()
    out = try readchomp(pipeline(`brew list lua`, `grep liblua`, `grep 5.3`)) catch _ "" end
    for lib in split(out, '\n')
        if Libdl.dlopen_e(lib) != C_NULL
            global liblua = lib
            break
        end
    end
else
    out = try readchomp(pipeline(`ldconfig -p`, `grep liblua`, `grep 5.3`)) catch _ "" end
    for lib in map(line -> split(line)[end], split(out, '\n'; keepempty=false))
        if Libdl.dlopen_e(lib) != C_NULL
            global liblua = lib
            break
        end
    end
end
liblua === nothing && error("Couldn't find liblua")

# Write out the deps file.
write(
    joinpath(@__DIR__, "deps.jl"),
    "# This file is automatically generated, do not modify it.\n\n",
    "const liblua = $(repr(liblua))\n\n",
    consts, "\n",
)

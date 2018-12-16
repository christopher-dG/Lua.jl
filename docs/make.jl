using Documenter, Lua

makedocs(;
    modules=[Lua],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/christopher-dG/Lua.jl/blob/{commit}{path}#L{line}",
    sitename="Lua.jl",
    authors="Chris de Graaf",
    assets=[],
)

deploydocs(;
    repo="github.com/christopher-dG/Lua.jl",
)

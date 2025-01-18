using VHSJuliaKursPackage
using Documenter

DocMeta.setdocmeta!(VHSJuliaKursPackage, :DocTestSetup, :(using VHSJuliaKursPackage); recursive=true)

makedocs(;
    modules=[VHSJuliaKursPackage],
    authors="Frank Zimmer <frank.e.zimmer@gmail.com> and contributors",
    sitename="VHSJuliaKursPackage.jl",
    format=Documenter.HTML(;
        canonical="https://dressedfez.github.io/VHSJuliaKursPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/dressedfez/VHSJuliaKursPackage.jl",
    devbranch="main",
)

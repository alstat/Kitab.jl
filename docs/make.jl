using Documenter
using Kitab

makedocs(
    sitename = "Kitab",
    format = Documenter.HTML(),
    modules = [Kitab]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#

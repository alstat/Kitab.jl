module Kitab
using HTTP

include("datasets.jl")
include("utils.jl")

export extract, delete!, download, list
export MetaData, OpenITIDB, DB

end # module

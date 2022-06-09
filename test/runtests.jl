using Kitab
using Test

delete!(OpenITIDB)

url = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown"
download(OpenITIDB(url))

@test list(DB(:ah))[1] == "0275AH"
@test list(DB(:authors)) == Dict{String,Vector{String}}("0275AH" => ["0261Muslim"])
@test list(DB(:books))["0275AH"] == Dict{String,Vector{String}}("0261Muslim" => ["0261Muslim.Sahih"])
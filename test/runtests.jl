using Kitab
using Test

delete!(OpenITIDB)

url = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown"
get(OpenITIDB, url)

df = list(OpenITIDB)
@test values(df[1, :]) == ("0275AH", "0261Muslim", "0261Muslim.Sahih", "0261Muslim.Sahih.Shamela0001727-ara1.mARkdown.txt")

txt = load(OpenITIDB, 1)
@test txt[end] == "~~PageV00P000 ms1663"

meta = extract(MetaData, txt)
@test meta.author == "مسلم بن الحجاج أبو الحسن القشيري النيسابوري"

muslimsahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown";
bukharisahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Sahih/0256Bukhari.Sahih.JK000110-ara1.completed";
bukhariducafa = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Ducafa/0256Bukhari.Ducafa.Shamela0008632-ara1.mARkdown";
get(OpenITIDB, [muslimsahih, bukhariducafa, bukharisahih])

df = list(OpenITIDB)
@test size(df, 1) == 3
@test values(df[2, :]) == ("0275AH", "0256Bukhari", "0256Bukhari.Sahih", "0256Bukhari.Sahih.JK000110-ara1.completed.txt")

delete!(OpenITIDB, 1)
df = list(OpenITIDB)
@test size(df, 1) == 2
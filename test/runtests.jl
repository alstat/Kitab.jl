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

muslim_sahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown";
bukhari_sahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Sahih/0256Bukhari.Sahih.JK000110-ara1.completed";
bukhari_ducafa = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Ducafa/0256Bukhari.Ducafa.Shamela0008632-ara1.mARkdown";
get(OpenITIDB, [bukhari_ducafa, bukhari_sahih])

df = list(OpenITIDB)
@test values(df[2, :]) == ("0275AH", "0256Bukhari", "0256Bukhari.Sahih", "0256Bukhari.Sahih.JK000110-ara1.completed.txt")

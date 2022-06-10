# MetaData
In this section, we are going to demonstrate how to use the package.

## Extraction of MetaData
To extract the meta data of the book, we use the API `extract(MetaData, text)`. So that, the following will download Muslim Sahih (shamela):

```@repl abc
using Kitab

muslim_sahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown";
download(OpenITIDB(muslim_sahih))
list(OpenITIDB)
text = load(OpenITIDB, 1)
extract(MetaData, text)
```
# Usage
In this section, we are going to demonstrate how to use the package.

## Downloading OpenITI Data
The data is available in the repositories of [OpenITI Github group](https://github.com/OpenITI), arranged according to Hijrah year of the books. Further, most of these books are also available in the catalog of books metada of the [KITAB project](https://kitab-project.org/), which can be accessed via this [link](https://kitab-corpus-metadata.azurewebsites.net/).
```@repl abc
using Kitab

muslim_sahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0261Muslim/0261Muslim.Sahih/0261Muslim.Sahih.Shamela0001727-ara1.mARkdown";
download(OpenITIDB(muslim_sahih))
```
## Downloading Multiple URLs
To download multiple URLs, use an array of it.
```@repl abc
bukhari_sahih = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Sahih/0256Bukhari.Sahih.JK000110-ara1.completed"
bukhari_ducafa = "https://raw.githubusercontent.com/OpenITI/0275AH/master/data/0256Bukhari/0256Bukhari.Ducafa/0256Bukhari.Ducafa.Shamela0008632-ara1.mARkdown"

download(OpenITIDB([bukhari_sahih, bukhari_ducafa]))
```
Once downloaded, re-downloading will not proceed if the file already exists.
```@repl abc
download(OpenITIDB([bukhari_sahih, bukhari_ducafa]))
```

## List downloaded OpenITI Data
To list the downloaded data, simply use the `list` function as follows:
```@repl abc
list(OpenITIDB)
```

## Load OpenITI Data
To load the data from the list of downloaded OpenITI data, we simply specify the row of the file from the `list(OpenITIDB)`.
```@repl abc
load(OpenITIDB, 1)
load(OpenITIDB, 2)
load(OpenITIDB, 3)
```

## Delete OpenITI Local DB folder
To delete local DB folder, simply run the following:
```@repl abc
delete!(OpenITIDB)
```
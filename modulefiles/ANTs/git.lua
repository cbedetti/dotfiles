-- -*- lua -*-
help([[
ANTs: Advanced Normalization Tools.

]])

whatis("Name        : ANTs")
whatis("Version     : git")
whatis("Category    : Application")
whatis("Description : Advanced Normalization Tools")
whatis("URL         : https://github.com/stnava/ANTs")
whatis("Created on  : 2017-02-16")

dir=os.getenv("HOME") .. "/local" or ""
prepend_path("PATH", dir .. "/antsbin/bin")

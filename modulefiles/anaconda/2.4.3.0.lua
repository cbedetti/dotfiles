-- -*- lua -*-
help([[
Anaconda2: Open Data Science Platform Powered by Python.
]])

whatis("Name        : Anaconda2")
whatis("Version     : 4.3.0")
whatis("Category    : Application")
whatis("Description : Open Data Science Platform Powered by Python")
whatis("URL         : https://www.continuum.io/anaconda-overview")
whatis("Created on  : 2017-02-06")

dir=os.getenv("HOME") .. "/local" or ""
prepend_path("PATH", dir .. "/anaconda2/bin")

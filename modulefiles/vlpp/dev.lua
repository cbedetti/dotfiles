-- -*- lua -*-
help([[
Villeneuve's Lab PET Pipeline
An open source software suite for processing brain PET images.
]])

whatis("Name        : vlpp")
whatis("Version     : dev")
whatis("Category    : Application")
whatis("Description : Neuroimaging software analysis")
whatis("URL         : htts://github.com/TBA")
whatis("Created on  : 2017-02-14")

dir=os.getenv("HOME") .. "/local" or ""
prepend_path("PATH", dir .. "/vlpp/bin")


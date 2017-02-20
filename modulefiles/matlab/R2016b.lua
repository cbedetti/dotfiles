-- -*- lua -*-
help([[
FreeSurfer Software Suite
An open source software suite for processing and analyzing (human) brain MRI images.
]])

whatis("Name        : Matlab")
whatis("Version     : R2016b")
whatis("Category    : Application")
whatis("Description : Neuroimaging software analysis")
whatis("URL         : https://surfer.nmr.mgh.harvard.edu/")
whatis("Created on  : 2017-02-14")

dir=os.getenv("HOME") .. "/local" or ""
prepend_path("PATH", dir .. "/MATLAB/R2016b/bin")


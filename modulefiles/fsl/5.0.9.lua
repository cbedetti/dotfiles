-- -*- lua -*-
help([[
FSL is a comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data.
]])

whatis("Name        : FSL")
whatis("Version     : 5.0.9")
whatis("Category    : Application")
whatis("Description : Neuroimaging software analysis")
whatis("URL         : https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/")
whatis("Created on  : 2017-02-07")

fsldir=os.getenv("HOME") .. "/local/fsl" or ""
setenv("FSLDIR", fsldir)
setenv("FSLGECUDAQ", "cuda.q")
setenv("FSLLOCKDIR", "")
setenv("FSLMACHINELIST", "")
setenv("FSLMULTIFILEQUIT", "TRUE")
setenv("FSLOUTPUTTYPE", "NIFTI_GZ")
setenv("FSLREMOTECALL", "")
setenv("FSLTCLSH", fsldir .. "/bin/fsltclsh")
setenv("FSLWISH", fsldir .. "/bin/fslwish")
prepend_path("LD_LIBRARY_PATH", fsldir)
prepend_path("PATH", fsldir .. "/bin")


-- -*- lua -*-
help([[
FreeSurfer Software Suite
An open source software suite for processing and analyzing (human) brain MRI images.
]])

whatis("Name        : FreeSurfer")
whatis("Version     : 6.0.0")
whatis("Category    : Application")
whatis("Description : Neuroimaging software analysis")
whatis("URL         : https://surfer.nmr.mgh.harvard.edu/")
whatis("Created on  : 2017-02-07")

fsdir=os.getenv("HOME") .. "/local/freesurfer" or ""
fsldir=os.getenv("HOME") .. "/local/fsl" or ""
setenv("FIX_VERTEX_AREA", "")
setenv("FREESURFER_HOME", fsdir)
setenv("FSFAST_HOME", fsdir .. "/fsfast")
setenv("FSF_OUTPUT_FORMAT", "nii.gz")
setenv("FS_FREESURFERENV_NO_OUTPUT", "initialized")
setenv("FSL_BIN", fsldir .. "/bin")
setenv("FSLCONVERT", "/usr/bin/convert")
setenv("FSL_DIR", fsldir )
setenv("FSLDISPLAY", "/usr/bin/display")
setenv("FS_OVERRIDE", "0")
setenv("FUNCTIONALS_DIR", fsdir .. "/sessions")
setenv("LOCAL_DIR", fsdir .. "/local")
setenv("MINC_BIN_DIR", fsdir .. "/mni/bin")
setenv("MINC_LIB_DIR", fsdir .. "/mni/lib")
setenv("MNI_DATAPATH", fsdir .. "/mni/data")
setenv("MNI_DIR", fsdir .. "/mni")
setenv("MNI_PERL5LIB", fsdir .. "/mni/share/perl5")
setenv("NO_FSFAST", "initialized")
setenv("OS", "Linux")
prepend_path("PATH", fsdir .. "/mni/bin")
prepend_path("PATH", fsdir .. "/tktools")
prepend_path("PATH", fsdir .. "/fsfast/bin")
prepend_path("PATH", fsdir .. "/bin")
setenv("PERL5LIB", fsdir .. "/mni/share/perl5")
setenv("SUBJECTS_DIR", fsdir .. "/subjects")


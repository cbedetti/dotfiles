-- -*- lua -*-
help([[
ITK-SNAP is a software application used to segment structures in 3D medical images.
]])

whatis("Name        : ITK-SNAP")
whatis("Version     : 3.6.0")
whatis("Category    : Application")
whatis("Description : ")
whatis("URL         : http://www.itksnap.org")
whatis("Created on  : 2017-05-02")

dir=os.getenv("HOME") .. "/local" or ""
prepend_path("PATH", dir .. "/itksnap-3.6.0-20170401-Linux-x86_64/bin")

if [ $# -eq 0 ]
  then
    echo "Optimising all images"
    imageOptim -d 620/
    imageOptim -d 1240/
    imageOptim -d full/
    echo "Second pass"
    imageOptim -d 620/
    imageOptim -d 1240/
    imageOptim -d full/
  else
    echo "Optimising images that begin with '$1'"
    find 620/$1* | imageOptim
    find 1240/$1* | imageOptim
    find full/$1* | imageOptim
    echo "Second pass"
    find 620/$1* | imageOptim
    find 1240/$1* | imageOptim
    find full/$1* | imageOptim
fi

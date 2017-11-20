#! /bin/bash

# CK installation script for CNTK package
#
# Developer(s):
#  * Grigori Fursin, dividiti/cTuning foundation
#

# PACKAGE_DIR
# INSTALL_DIR

export CNTK_LIB_DIR=${INSTALL_DIR}/lib

echo ""
echo "Removing '${CNTK_LIB_DIR}' ..."
rm -rf ${CNTK_LIB_DIR}

######################################################################################
# Print info about possible issues
echo ""
echo "Note that you sometimes need to upgrade your pip to the latest version"
echo "to avoid well-known issues with user/system space installation:"

echo ""
read -r -p "Install OpenCV and other dependencies via sudo pip (Y/n)? " x

case "$x" in
  [nN][oO]|[nN])
    ;;
  *)
    sudo ${CK_PYTHON_PIP_BIN} install --upgrade pip
    sudo ${CK_PYTHON_PIP_BIN} install requests matplotlib jupyter opencv-python
#    if [ "${CK_PYTHON_VER3}" == "YES" ] ; then
#      sudo apt-get install python3-tk
#    else
#      sudo apt-get install python-tk
#    fi 
    ;;
esac

######################################################################################
URL=https://cntk.ai/PythonWheel/${CNTK_PACKAGE_TYPE}/cntk-${CNTK_PACKAGE_VER}-${CNTK_PACKAGE_FILE_EXT}

echo ""
echo "Downloading and installing CNTK prebuilt binaries (${URL}) ..."
echo ""

${CK_PYTHON_PIP_BIN} install ${URL} --ignore-installed --prefix ${INSTALL_DIR}/lib --system
if [ "${?}" != "0" ] ; then
  echo "Error: installation failed!"
  exit 1
fi

# Trying to remove pythonX from path (to unify installation via CK)
cd $INSTALL_DIR/lib/lib
cd `ls`
mv * ..

exit 0

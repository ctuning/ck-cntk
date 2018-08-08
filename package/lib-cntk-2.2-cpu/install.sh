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
echo "to avoid well-known issues with user/system space installation..."

SUDO="sudo "
if [[ ${CK_PYTHON_PIP_BIN_FULL} == /home/* ]] ; then
  SUDO=""
fi

######################################################################################
# Check if has --system option
${CK_ENV_COMPILER_PYTHON_FILE} -m pip install --help > tmp-pip-help.tmp
if grep -q "\-\-system" tmp-pip-help.tmp ; then
 SYS=" --system"
fi
rm -f tmp-pip-help.tmp

######################################################################################
echo "Downloading and installing Python deps ..."
echo ""

EXTRA_PYTHON_SITE=${INSTALL_DIR}/lib
mkdir -p ${EXTRA_PYTHON_SITE}

${CK_ENV_COMPILER_PYTHON_FILE} -m pip install --ignore-installed requests matplotlib jupyter opencv-python -t ${EXTRA_PYTHON_SITE}  ${SYS}
if [ "${?}" != "0" ] ; then
  echo "Error: installation failed!"
  exit 1
fi

######################################################################################
URL=https://cntk.ai/PythonWheel/${CNTK_PACKAGE_TYPE}/cntk${CNTK_PACKAGE_EXT}-${CNTK_PACKAGE_VER}-${CNTK_PACKAGE_FILE_EXT}

echo ""
echo "Downloading and installing CNTK prebuilt binaries (${URL}) ..."
echo ""

${CK_PYTHON_PIP_BIN_FULL} install ${URL} --ignore-installed --prefix ${INSTALL_DIR}/lib ${SYS}
if [ "${?}" != "0" ] ; then
  echo "Error: installation failed!"
  exit 1
fi

# Trying to remove pythonX from path (to unify installation via CK)
cd $INSTALL_DIR/lib/lib
cd `ls`
mv * ..

exit 0

Update-ExecutionPolicy Unrestricted

# Enables TLS 1.2 for curl (HTTP connection would fail without this)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Install official Chocolatey packages
cinst cppcheck
cinst curl
cinst git
cinst hg
cinst opencv -package-parameters '/InstallationPath:\ /Environment:\opencv' --version 3.4.1
cinst patch
cinst peazip
cinst pip
cinst python3
cinst svn
cinst unzip
cinst visualstudio2017community -package-parameters "--config $((Get-Location).Path + '\vsconfig')"

# Downloads and install OSRF Chocolatey packages
New-Item -ItemType Directory -Force -Path \dev\ros2\tmp
curl https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/asio.1.12.1.nupkg -o \dev\ros2\tmp\asio.1.12.1.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/eigen.3.3.4.nupkg -o \dev\ros2\tmp\eigen.3.3.4.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/tinyxml-usestl.2.6.2.nupkg -o \dev\ros2\tmp\tinyxml-usestl.2.6.2.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2018-06-12-1/tinyxml2.6.0.0.nupkg -o \dev\ros2\tmp\tinyxml2.6.0.0.nupkg

# TODO: stop pulling from my fork and Google Drive
curl https://github.com/thomas-moulard/choco-packages/releases/download/2018-01-19-1/OpenSplice.6.9.181127.nupkg -o \dev\ros2\tmp\OpenSplice.6.9.181127.nupkg
curl https://github.com/thomas-moulard/choco-packages/releases/download/2018-01-19-1/OpenSSL.1.1.1.20181020.nupkg -o \dev\ros2\tmp\OpenSSL.1.1.1.20181020.nupkg
curl https://github.com/thomas-moulard/choco-packages/releases/download/2018-01-19-1/rti-connext.5.3.1.nupkg -o \dev\ros2\tmp\rti-connext.5.3.1.nupkg
curl https://drive.google.com/open?id=1_iomH8tGLepUXdMVVArTRXhdUHZAVxd_ -o \dev\ros2\tmp\qt-sdk-5.10.0.nupkg

cinst -s \dev\ros2\tmp `
  OpenSSL `
  OpenSplice `
  asio `
  eigen `
  qt5-sdk `
  rti-connext `
  tinyxml-usestl `
  tinyxml2

pip3 install -U `
  EmPy `
  PyQt5 `
  catkin_pkg `
  colcon-common-extensions `
  coverage `
  flake8 `
  flake8-blind-except `
  flake8-builtins `
  flake8-class-newline `
  flake8-comprehensions `
  flake8-deprecated `
  flake8-docstrings `
  flake8-import-order `
  flake8-quotes `
  git+https://github.com/lark-parser/lark.git@0.7b `
  mock `
  opencv-python `
  pep8 `
  pydocstyle `
  pydot `
  pyparsing `
  pyyaml `
  setuptools `
  vcstool

# Checkout source code
curl https://raw.githubusercontent.com/ros2/ros2/release-latest/ros2.repos -o \dev\ros2\ros2.repos
cd \dev\ros2
vcs import --input ros2.repos src

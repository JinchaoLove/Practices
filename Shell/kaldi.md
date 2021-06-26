## Installation
kaldi (mac)
tools $ ./extras/check_dependencies.sh
- Problem: Intel MKL does not seem to be installed.
- Solution: (1) download and install official Intel [MKL](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onemkl/download.html). (2) create symlink: `sudo ln -s /opt/intel/oneapi/mkl/2021.2.0 /opt/intel/mkl`

kaldi (linux)
src $ ./configure --shared
- Problem: ./exp-test: /lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by /home/jcli/kaldi/tools/openfst-1.7.2/lib/libfst.so.16)
- Solution: `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/gcc-7.3.0/lib64`



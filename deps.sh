#!/bin/bash

CFGPARMS_SSL="--prefix=/openssl linux-generic32 -m32 shared"
CFGPARMS_XERCES="--prefix=/xerces"
CFGPARMS_JANSON="--prefix=/jansson"

export CXXFLAGS=-m32
export CFLAGS=-m32
tar -xvf ECR-Dependencias/openssl-1.0.0e.tar.gz 
cp -rf openssl-1.0.0e /openssl
cd /openssl 
./Configure ${CFGPARMS_SSL} 
make -j4  
make -j4 install
cp /openssl/libssl.pc /usr/share/pkgconfig
cp /openssl/libcrypto.pc /usr/share/pkgconfig
cp /openssl/openssl.pc /usr/share/pkgconfig
cd -
tar -xvf ECR-Dependencias/jansson-2.7.tar.gz      
cd jansson-2.7       
./configure ${CFGPARMS_JANSON}  
make -j4                                            
make -j4 install 
cp jansson.pc /usr/share/pkgconfig
cd ..
tar -xvf ECR-Dependencias/xerces-c-3.1.1.tar.gz 
cd xerces-c-3.1.1          
./configure ${CFGPARMS_XERCES} 
make -j4                                           
make -j4 install 
cp xerces-c.pc /usr/share/pkgconfig
cd ..
tar -xvf ECR-Dependencias/cmake-3.17.1.tar.gz
cd cmake-3.17.1
./bootstrap -- -DCMAKE_USE_OPENSSL=OFF
make -j4 && make install
cd ..
tar -xvf ECR-Dependencias/dockcross.tar.gz
cp -rf dockcross /
exit 0

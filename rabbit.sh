
tar xvf boost_1_76_0.tar.gz
cd boost_1_76_0
sh -x bootstrap.sh
./b2 install  -j4 address-model=32 architecture=x86 link=static
cd ..

tar xvf rabbitmq-c.tar.gz
cd rabbitmq-c
cmake . -Bbuild-32-static -DCMAKE_C_FLAGS=-m32 -DENABLE_SSL_SUPPORT=OFF -DBUILD_API_DOCS=OFF -DBUILD_STATIC_LIBS=ON
make -j4 -Cbuild-32-static
make -j4 -Cbuild-32-static install
cd ..


tar xvf SimpleAmqpClient.tar.gz
cd SimpleAmqpClient
cmake . -Bbuild-32-static -DCMAKE_CXX_FLAGS=-m32 -DENABLE_SSL_SUPPORT=OFF -DBUILD_API_DOCS=OFF -DBoost_Dynamic_Linking_ENABLED=OFF -DBUILD_SHARED_LIBS=OFF
make -j4 -Cbuild-32-static
make -j4 -Cbuild-32-static install
cd ..


#make . -Bbuild-32-static -DCMAKE_CXX_FLAGS="-D_GLIBCXX_USE_CXX11_ABI=0 -m32" -DENABLE_SSL_SUPPORT=OFF -DBUILD_API_DOCS=OFF -DBoost_Dynamic_Linking_ENABLED=OFF -DBUILD_SHARED_LIBS=OFF 

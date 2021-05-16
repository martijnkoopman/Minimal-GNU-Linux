
# Build Hello World init process
```
gcc -static init.c -o init
```

```
mkdir LINUX
sudo mount /dev/sda2 LINUX
```

```
sudo mkdir LINUX/sbin
sudo cp init LINUX/sbin/init
```

# Build Bash shell
```
wget https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz
tar -xf bash-5.1.tar.gz
mkdir bash-build
mkdir bash-install
cd bash-install
../bash-src/configure --enable-minimal-config --without-curses --without-bash-malloc --enable-static-link --prefix=/home/martijn/Development/Projects/Minimal-GNU-Linux/bash-5.1/install
```

# Build GNU Coreutils
```
wget https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.gz
tar -xf coreutils-8.32.tar.gz
mkdir coreutils-install
mkdir coreutils-build
cd coreutils-build
../coreutils-8.32/configure LDFLAGS=-static --prefix=/home/martijn/Development/Projects/Minimal-GNU-Linux/coreutils-install
make

```

# Build GNU C and C++ compiler (GCC)s
```
wget http://mirror.koddos.net/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.gz
tar -xf gcc-11.1.0.tar.gz
cd gcc-11.1.0
./contrib/download_prerequisites
mkdir install
mkdir build
cd build
../configure --disable-shared --enable-languages=c --disable-multilib --prefix=/home/martijn/Development/Projects/Minimal-GNU-Linux/gcc-11.1.0/install
make
make install
```
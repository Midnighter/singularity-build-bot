sudo rm -rf /usr/local/go # remove preinstalled go
sudo apt-get update -qq && sudo apt-get -qq install -y build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev pkg-config > /dev/null 2>&1
echo "Requirements installed. Installing Go..."

# install go
wget -q https://dl.google.com/go/go1.12.9.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.9.linux-amd64.tar.gz
rm go1.12.9.linux-amd64.tar.gz
echo "Go successfully installed. Installing Singularity..."

# get deps
go get -u github.com/golang/dep/cmd/dep > /dev/null 2>&1
go get -d github.com/sylabs/singularity > /dev/null 2>&1 && exit 0 

# install singularity
mkdir -p $HOME/go/src/github.com/sylabs
cd $HOME/go/src/github.com/sylabs
wget -q https://github.com/sylabs/singularity/releases/download/v3.3.0/singularity-3.3.0.tar.gz
tar -xzf singularity-3.3.0.tar.gz
cd ./singularity
./mconfig 1> /dev/null
make -C ./builddir 1> /dev/null
sudo make -C ./builddir install 1> /dev/null
echo "Singularity successfully installed."

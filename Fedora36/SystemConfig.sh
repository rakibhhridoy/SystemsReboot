pass="Password"
alias s="echo $pass | sudo -S"
alias sdi="s dnf -y install"
alias sdr="s dnf remove -y"

cd
touch .zshrc && touch .bashrc

mkdir Apps
cd Apps


# ================================== Fedora Core =================================

# [1] ------ Terminal & Utilities ------^
s dnf -y update
sdi yakuake bat curl wget gzip htop tree wireshark \
         neofetch tar tcpdump


# [2] ------ media utils ------^
sdi ktorrent okular

# [3] rpm fusion repo enable ![resolve host issue]
lrpmfusion1="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
lrpmfusion2="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sdi $lrpmfusion1 $lrpmfusion2
s dnf -y group update core




# [4]------ git setup ------^
userName="username"
userEmail="email"

sdi git 
git config --global user.name $userName
git config --global user.email $userEmail

sdi 'dnf-command(config-manager)'
s dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sdi gh




# [5]------ languages setup ------^

# []Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           

# []Golang
sdi golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc     
source $HOME/.bashrc && source $HOME/.zshrc

# []zsh
sdi zsh 




# [6] ------ Containerization & Virualization ------
# []docker setup
sdr docker docker-client docker-client-latest docker-common \
docker-latest docker-latest-logrotate docker-logrotate \
docker-selinux docker-engine-selinux docker-engine

sdi dnf-plugins-core
s dnf config-manager \
--add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sdi docker-ce docker-ce-cli containerd.io docker-compose-plugin

# []virtualbox

sdi @development-tools && sudo dnf -y install kernel-headers \
kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

wget download.virtualbox.org/virtualbox/6.1.38/VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm
s dnf makecache --refresh
sdi SDL
s rpm -i VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm.1
s usermod -a -G vboxusers $USER && newgrp vboxusers

# []qemu
sdi qemu




# ================================= Custumization ================================

# [1]------ Social -------^
# []brave-browser
sdi -y dnf-plugins-core
s dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
s rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sdi brave-browser

# []discord
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
s dnf update -y && sdi discord

# []zoom
wget zoom.us/client/5.12.2.4816/zoom_x86_64.rpm
s rpm -i zoom_x86_64.rpm






# [2]------- Jetbrains ------
# []Goland
wget -O goland.tar.gz jetbrains.com/go/download/download-thanks.html?platform=linux

# []Intellij Ultimate
wget -O intelliju.tar.gz jetbrains.com/idea/download/download-thanks.html?platform=linux

# []Intellij Community
wget -O intellijc.tar.gz jetbrains.com/idea/download/download-thanks.html?platform=linux&code=IIC

# []Pycharm Pro
wget -O pycharmpro.tar.gz jetbrains.com/pycharm/download/download-thanks.html?platform=linux

# []Pycharm Community
wget -O pycharmcom.tar.gz jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC

# []unzip and install
golpath="alias goland=~/Apps/goland/bin/goland.sh"
intupath="alias intellij=~/Apps/intelliju/bin/idea.sh"
intcpath="alias intellijc=~/Apps/intellijc/bin/idea.sh"
pypro="alias pycharm=~/Apps/pycharmpro/bin/pycharm.sh"
pycom="alias pycharmc=~/Apps/pycharmcom/bin/pycharm.sh"


tar -xzf goland.tar.gz | echo $golpath >> .zshrc | echo $golpath >> .bashrc 
tar -xzf intelljiu.tar.gz | echo $intupath >> .zshrc | echo $intupath >> .bashrc
tar -xzf intelljic.tar.gz | echo $intcpath >> .zshrc | echo $intcpath >> .bashrc
tar -xzf pycharmpro.tar.gz | echo $pypro >> .zshrc | echo $pypro >> .bashrc
tar -xzf pycharmcom.tar.gz | echo $pycom >> .zshrc | echo $pycom >> .bashrc

source .zshrc && source .bashrc


# [2]bropages
cargo install bropages
multipass unalias s sdr sdi
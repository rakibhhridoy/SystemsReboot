alias s="echo $1 | sudo -S"
alias sdi="s dnf -y install"

cd 
mkdir Apps
cd Apps


# ======== Fedora Core ===========
# [1] Terminal & Utilities^

s dnf -y update
sdi yakuake bat curl wget gzip htop tree wireshark \
         neofetch tar tcpdump


# [2] media utils^

sdi ktorrent okular

# [3] rpm fusion repo enable ![resolve host issue]

lrpmfusion1="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
lrpmfusion2="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sdi $lrpmfusion1 $lrpmfusion2
s dnf -y group update core



# [4] git setup^

echo "github setup:: username:"
read username
echo "email:"
read email

sdi git 
git config --global user.name $userName
git config --global user.email $userEmail



# [5] languages setup^

# [Rust]
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh           

# [Golang]
sdi golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc >> $HOME/.zshrc     
source $HOME/.bashrc && source $HOME/.zshrc

# [zsh]
sdi zsh 




# [6] Browsers

# [brave-browser]
sdi -y dnf-plugins-core
s dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
s rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sdi brave-browser




# [7] Social Platform

# [Discord] 
wget discord.com/api/download?platform=linux&format=tar.gz 
tar -xzf discord-0.0.20.tar.gz
dpath="$HOME/Discord/Discord"
echo "alias discord=$dpath" >> $HOME/.zshrc && echo "alias discord=$dpath" >> $HOME/.bashrc

# [telegram 4.5.3]
wget telegram.org/dl/desktop/linux
tar -xzf tsetup.4.5.3.tar.gz
tpath="$HOME/Telegram/Telegram"
echo "alias telegram=$tpath" >> $HOME/.zshrc && echo "alias telegram=$tpath" >> $HOME/.bashrc



# [8] Virtualization And Container

# docker setup
s dnf remove -y docker docker-client docker-client-latest docker-common \
                docker-latest docker-latest-logrotate docker-logrotate \
                docker-selinux docker-engine-selinux docker-engine

sdi dnf-plugins-core
s dnf config-manager \
    --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

s dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin   




# virtualbox
sdi @development-tools && sudo dnf -y install kernel-headers \
                    kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

wget download.virtualbox.org/virtualbox/6.1.38/VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm
s dnf makecache --refresh
sdi SDL

s rpm -i VirtualBox-6.1-6.1.38_153438_fedora36-1.x86_64.rpm.1
s usermod -a -G vboxusers $USER && newgrp vboxusers


s dnf install qemu -y

# jetbrains 





# bropages
cargo install bropages






unalias s
# -*- coding: utf-8 -*-


import os
import random
import string
from fabric.api import cd, run, sudo
from os.path import join as opa


def hostname():
    sudo('uname -s')
    h = sudo('echo $HOSTNAME')
    print(h)


## Helpers

def id_generator(size=24, chars=string.ascii_uppercase+string.digits):
    return ''.join(random.SystemRandom().choice(chars) for _ in range(size))

def mkdir(directory):
    sudo("mkdir -p {}".format(directory))

def rmf(directory):
    sudo("rm -Rf {}".format(directory))

def wget(link):
    sudo("wget {}".format(link))

def add_repo(arg):
    sudo("add-apt-repository -y {}".format(arg))

def apt(args="", action="install"):
    cmd = "apt {} -y {}".format(action, args)
    sudo(cmd)


## Repositories

def arc():
    """This step won't be needed after Ubuntu 16.04
    """
    link = "http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/"
    tDir = opa(os.sep, "tmp", id_generator)
    mkdir(tDir)
    with cd(tDir):
        wget("{}Release.key".format(link))
        sudo("apt-key add - < Release.key")
        sudo("rm Release.key")
        add_repo("'deb {} /'".format(link))
    rmf(tDir)

def dropBox():
    sudo("apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E")
    add_repo("'deb http://linux.dropbox.com/ubuntu xenial main'")

def spotify():
    sudo("apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886")
    add_repo("'deb http://repository.spotify.com stable non-free'")

REPOS = [
        "ppa:moka/daily",
        #"ppa:neovim-ppa/stable",
        #"ppa:daniel.pavel/solaar", #No need for Ubuntu 16.04
        "multiverse", #for steam
        ]

def add_repositories():
    arc()
    dropbox()
    spotify()
    for arg in REPOS:
        add_repo(arg)

APT_REPOS = [
        "arc-theme",
        "dropbox",
        "spotify-client",
        "moka-icon-theme",
        #"neovim",
        "steam",
        ]

# Packages

APT_PKGS = [
        "build-essential",
        #"clementine",
        "cmake",
        "colordiff",
        "curl",
        "gimp",
        "git",
        "gnucash",
        "gramps",
        #"hexchat",
        "htop",
        #"inkscape",
        "keepassx", #https://dev.keepassx.org/issues/152
        "libreoffice",
        "pandoc",
        #"powertop",
        "solaar",
        #"sparkleshare",
        "texlive",
        "tmux",
        "vlc", #à compiler
        "xdotool",
        ]

def apt_install_pkgs(pkgs):
    apt(args=" ".join(pkgs))


# Softwares

def rust():
    tDir = opa(os.sep, "tmp", id_generator)
    mkdir(tDir)
    with cd(tDir):
        s="install_rust"
        sudo("curl https://sh.rustup.rs -sSf > {}".format(s))
        sudo("chmod u+x {}".format(s))
        sudo("./{} --no-modify-path -y".format(s))
    rmf(tDir)


# Installs scripts

def install_desktop():
    #Make usefull directories & links
    for path in ["local", "Projets", "Sandbox"]:
        mkdir(opa(os.environ["HOME"], path))
    #ln -s ${HOME}/dotfiles/bin ${HOME}

    #install ssh
    """if [ -d ${HOME}/dotfiles/private/ssh ]
    then
        chmod -R 700 ${HOME}/dotfiles/private/ssh
        chmod 600 ${HOME}/dotfiles/private/ssh/*
        mkdir -p ${HOME}/.ssh
        cp ${HOME}/dotfiles/private/ssh/id_rs* ${HOME}/.ssh
    fi
    """

    add_repositories()
    #Make sure everything is up to date before messing with stuff
    apt(action="update")
    apt(action="upgrade")
    apt_install_pkgs(APT_PKGS + APT_REPOS)

    #modulefiles
    #"lmod", #à déplacer
    #ln -s ${HOME}/dotfiles/modulefiles ${HOME}/local

    #Slack
    sudo apt install -y ${HOME}"/dotfiles/private/src/slack-desktop-2.4.2-amd64.deb"

    #Freesurfer
    #sudo apt install -y tcsh

    #The End
    apt(action="update")
    apt(action="upgrade")
    apt(action="autoremove")


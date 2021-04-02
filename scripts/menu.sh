#!/bin/bash

# Turn off script exit on failure
set +e

## -------------------------------------------------------------------------------

function set_window_size() {
    #Use to set window (Standard: 80*24)
    echo -e '\033[8;25;80t'
    
}

function header() {
    echo -e "\e[1m\e[33m"
    cat ./scripts/logo
    echo -e "\e[0m"
    bar
}

function body() {
    echo
    echo -e "  [1] Jupyter Notebook Server (Tensorflow 2.4.1, Python 3.6.9, Ubuntu 18.04)"
    echo -e "  [2] Jupyter Notebook Server (Tensorflow 1.15.5, Python 3.6.9, Ubuntu 18.04)"
    echo -e "  [3] RStudio Server (R 4.0.4, Python 3.8.5, Ubuntu 20.04)"
     echo
}

function footer() {
    bar
    echo
    read -p "  Type [#] to open Image or [q] to quit: " opt
    echo
}
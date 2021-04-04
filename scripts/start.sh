#!/bin/bash

# Turn off script exit on failure
set +e

## -------------------------------------------------------------------------------
function start_tf2_jupyter() {
    tag_framework=${1}
    tag_framework_version=${2}

    if [ "$(detect_gpu)" = "--gpus all" ]; then
        tag_gpu="-gpu"
    else
        tag_gpu=""
    fi

    # Build image name
    imagetag="tensorflow/${tag_framework}:${tag_framework_version}${tag_gpu}-jupyter"

    # Set unique container name
    containername=$(get_uuid)

    clear

    echo

    header

    echo

    get_ctrlc_text

    docker run \
        --rm \
        --name $containername ${startparam} \
        -it \
        $(detect_gpu) \
        -p 8888 -p 6006-6015:6006-6015 \
        -v ~/dockervolume/:/tf/notebooks \
        -v $SSH_AUTH_SOCK:/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent \
        $imagetag \
	    /bin/bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.iopub_data_rate_limit=10000000" \
        | grep --line-buffered '     or http://127.0.0.1' | head -1 \
        | { token=$(sed -u 's/.*\///'); address=$(generate_url $containername); url="${address}/${token}";\
        printf "\e[1m\e[94m ==> \e]8;;$url\e\\Click here to open Jupyter Notebook Server in your Browser\e]8;;\e\\ \e[0m"; }

    echo -e "\n"
}

function start_tf1_jupyter() {
    tag_framework=${1}
    tag_framework_version=${2}

    if [ "$(detect_gpu)" = "--gpus all" ]; then
        tag_gpu="-gpu-py3"
    else
        tag_gpu="-py3"
    fi

    # Build image name
    imagetag="tensorflow/${tag_framework}:${tag_framework_version}${tag_gpu}-jupyter"

    # Set unique container name
    containername=$(get_uuid)

    clear

    echo

    header

    echo

    get_ctrlc_text

    docker run \
        --rm \
        --name $containername ${startparam} \
        -it \
        $(detect_gpu) \
        -p 8888 -p 6006-6015:6006-6015 \
        -v ~/dockervolume/:/tf/notebooks \
        -v $SSH_AUTH_SOCK:/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent \
        $imagetag \
        /bin/bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.iopub_data_rate_limit=10000000" \
        | grep --line-buffered '     or http://127.0.0.1' | head -1 \
        | { token=$(sed -u 's/.*\///'); address=$(generate_url $containername); url="${address}/${token}";\
        printf "\e[1m\e[94m ==> \e]8;;$url\e\\Click here to open Jupyter Notebook Server in your Browser\e]8;;\e\\ \e[0m"; }

    echo -e "\n"
}


## -------------------------------------------------------------------------------
function start_rstudio() {

    if [ "$(detect_gpu)" = "--gpus all" ]; then
        tag_gpu="-gpu"
    else
        tag_gpu=""
    fi

    # Build image name
    imagetag="rocker/ml-verse:4.0.4-cuda11.1"

    # Set unique container name
    containername=$(get_uuid)

    clear

    echo

    header

    echo

    get_ctrlc_text

    docker run \
        --rm \
        --name $containername \
        -it \
        $(detect_gpu) \
        -e DISABLE_AUTH=true -e ROOT=TRUE \
        -p 8787 \
        -v ~/dockervolume/:/home/rstudio \
        -v $SSH_AUTH_SOCK:/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent \
        $imagetag \
        /bin/bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.iopub_data_rate_limit=10000000" \
        | grep '\[services\.d\] done.' | head -1 \
        | { url=$(generate_url $containername); \
        printf "\e[1m\e[94m ==> \e]8;;$url\e\\Click here to open RStudio in your Browser\e]8;;\e\\ \e[0m"; }

    echo -e "\n"
}

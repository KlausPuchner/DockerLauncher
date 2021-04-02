# **DockerLauncher**
Just start developing instead of having to set up the environment for it! The Docker Launcher simplifies the usage of the AI/BI/Data Science development environments Jupyter Notebook Server and RStudio Server. This tool could be compared with Googles Colabs to some extent: It takes away the pain of configuring Deep Learning Backends like Tensorflow and getting them to run properly (especially on GPUs). It also provides automatic installation scripts for the necessary components such as Docker, the Nvidia Container Runtime and Nvidia GPU drivers.

## **Features**
- **IDEs**
    - **Jupyter Notebook Server**
        - Python 3.6.9
        - Ubuntu 18.04 LTS
        - CUDA (10.0 and 11.0)
        - Tensorflow (1.15.5 and 2.4.1)
    - **Rstudio Server** 
        - R 4.0.4
        - Python 3.8.5
        - Ubuntu 20.04 LTS
        - CUDA (11.1)
        - No preinstalled Tensorflow

- **Automated Installation and Configuration Tasks**
    - Installation and configuration of Docker
    - Installation and configuration of the Nvidia Container Runtime
    - Installation and configuration of the NVidia GPU driver
    - Automatic Docker Container download
    - Automatic Nvidia GPU capability detection (automatic GPU acceleration if available on computer)
    - Usage of actively mainteined Containers from Docker Hub
    - Contains "throwaway" (non persistent) containers for vanilla environments on startup
    - Automatic mount of folder in home drive into docker container for easy data exchange
    - Automatic forwarding of ssh keys into the container for ssh easy key reusage
    - Automatic updates for launcher

## **Requirements**
- **A computer**
- **A web browser (ideally Chrome)**
- **Ubuntu 20.04**

## **Get started**
Simply start the DockerLauncher by typing `bash launcher.sh` in your terminal.
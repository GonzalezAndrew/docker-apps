# Legos Docker Image
The 'Legos' Docker container is to be used to build, configure and test infrastructure or configuration scripts.

# Avaliable Packages
Below is a list of available packages in the Legos Docker container.
```
Ansible
Terraform
Vault
Packer
AWS CLI
```

# How to Build
This image is built with the use of GitHub actions when a commit is made to the repository. To build the image locally, follow the steps below:
1. [Install Docker](https://docs.docker.com/engine/install/).
2. Clone this repository.
3. Build the Docker image using the Dockerfile located in the Legos directory.
```
$ docker build -t legos:latest ./legos
```

# How to Use
1. [Install Docker](https://docs.docker.com/engine/install/).
2. Pull the image from DockerHub or build the image locally.
```
$ docker pull andrewgonzo/legos:latest
```
3. Run a command from the image:
```
$ docker run andrewgonzo/legos:latest terraform -version
```

# Example Usage
To better utilize the Legos container, you can create various bash functions that can be added in your `~/.bashrc` file or anywhere you store your extra bash functions.

```
legos(){
    local key=${1}
    case $1 in
        "ansible")
        bin=$1
        shift
        ;;
        "terraform")
        bin=$1
        shift
        ;;
        "vault")
        bin=$1
        shift
        ;;
        "packer")
        bin=$1
        shift
        ;;
        "aws")
        bin=$1
        shift
        ;;
        *)
        echo "Unrecognized option: $key"
        exit 1
    esac

    docker run --rm \
        -w /tmp \
        -v $(pwd):/tmp/ \
        -v ~/.aws/:/root/aws \
        -v ~/.ssh:/root/.ssh \
        andrewgonzo/legos:latest "$bin" "$@"
}
``` 

Example using the function above:
```
$ legos ansible --version
ansible 2.10.2
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.6/dist-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.6.9 (default, Oct  8 2020, 12:12:24) [GCC 8.4.0]
```
# Best Practices for writing Dockerfile

## Source repo exclude files with .dockerignore?
  To exclude files not relevant to the build (without restructuring your source repository) use a  file. This file supports exclusion patterns .dockerignore similar to  files. .gitignore
 
## Use multi-stage builds?
  Multi-stage builds allow you to drastically reduce the size of your final image, without struggling to reduce the number of intermediate layers and files.

## Install only necessary packages
  To reduce complexity, dependencies, file sizes, and build times, avoid installing extra or unnecessary packages just because they might be “nice to have.” For example, you don’t need to include a text editor in a database image.

## Setup custom Images for all base images in organization registry
  It is important to add specific version of base images to avoid automated upgrades. Almost all container registry supports automated container image builds when a container's base image is updated, such as when you patch the OS or application framework in one of your base images. With this we can maintain our own version of the base image.

## Try to keep a single process for the container?
  Limiting each container to one process is a good rule of thumb, but it is not a hard and fast rule.

## Container image has minimal layers
  Only the instructions RUN, COPY, ADD create layers. Other instructions create temporary intermediate images, and do not increase the size of the build. RUN COPY ADD And where possible, use multi-stage builds, and only copy the artifacts you need into the final image. 

## Use the multi-line arguments which are already sorted
  Whenever possible, ease later changes by sorting multi-line arguments alphanumerically. This helps to avoid duplication of packages and make the list much easier to update. This also makes PRs a lot easier to read and review. Adding a space before a backslash ( ) helps as well. \
  For example:
  `RUN apt-get update && apt-get install -y \  bzr \  cvs \  git \  mercurial \  subversion`

## Dockerfile to use COPY instead of ADD

  Although `ADD` and `COPY` are functionally similar, generally speaking, `COPY` is preferred. That’s because it’s more transparent than `ADD`. only ADD COPY COPY ADD COPY supports the basic copying of local files into the container, while  has some features (like local-only tar extraction and remote URL support) that are ADD not immediately obvious. Consequently, the best use for  is local tar file auto-extraction into the image, as in `ADD ADD rootfs.tar.xz /`

## Does the dockerfile use ENTRYPOINT as the main command of the image?

  CMD instruction allows you to set a default command, which will be executed only when you run container without specifying a command. If Docker container runs with a command, the default command will be ignored.
  The best use for  is to set the image’s main command, allowing that image to be run as though it was that command. ENTRYPOINT
  Prefer ENTRYPOINT to CMD when building executable Docker image and you need a command always to be executed. Additionally use CMD if you need to provide extra default arguments that could be overwritten from command line when docker container runs.

## Does the docker file use VOLUME for any mutable and/or user-serviceable parts of your image?
  The  instruction should be used to expose any database storage area, configuration storage, or files/folders created by your docker container. VOLUME You are strongly encouraged to use  for any mutable and/or user-serviceable parts of your image. VOLUME

## Container should use non-root user?
  If a service can run without privileges, use  to change to a non-root user. USER

## WORKDIR instruction should use absolute paths
  For clarity and reliability, you should always use absolute paths for your . WORKDIR
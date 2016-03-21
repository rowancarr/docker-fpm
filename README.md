# docker-fpm
Used to build packages as described at the fpm website

## usage
This has been tested so far build rpm's for python modules

```
docker run --rm -v ${VOLUME}/src:/src -i rowancarr/docker-fpm:latest -s python -t rpm jenkins-job-builder
```

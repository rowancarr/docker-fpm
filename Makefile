IDENTIFIER=docker-fpm
VERSION=latest
REGISTRY=rowancarr

default: build test
build:
	docker build -t ${REGISTRY}/${IDENTIFIER}:${VERSION} .

test:
	docker run --rm -i ${REGISTRY}/${IDENTIFIER}:${VERSION} sh -c 'which fpm || echo "[FAIL] - fpm not installed" && echo "[PASS] - fpm installed"'

deploy:
	docker tag -f ${REGISTRY}/${IDENTIFIER}:${VERSION} ${REGISTRY}/${IDENTIFIER}:latest
	docker push ${REGISTRY}/${IDENTIFIER}:${VERSION}
	docker push ${REGISTRY}/${IDENTIFIER}:latest

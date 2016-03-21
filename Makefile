IDENTIFIER=docker-fpm
VERSION=latest
REGISTRY=rowancarr
GH_TOKEN=

default: build test
build:
	docker build -t ${REGISTRY}/${IDENTIFIER}:${VERSION} .

test:
	docker run --rm --entrypoint sh -i ${REGISTRY}/${IDENTIFIER}:${VERSION} -c 'which fpm || echo "[FAIL] - fpm not installed" && echo "[PASS] - fpm installed"'

deploy:
	git config --global user.email "builds@travis-ci.com"
	git config --global user.name "Travis CI"
	git tag ${VERSION} -a -m "Generated tag from TravisCI for build ${TRAVIS_BUILD_NUMBER}"
	git push -q https://${GH_TOKEN}@github.com/${REGISTRY}/${IDENTIFIER} --tags

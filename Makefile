BOOTSTRAP_VERSION=3.3.7
STYLE_VERSION=0.3.0

all: build maven

build:
	BOOTSTRAP_VER=${BOOTSTRAP_VERSION} STYLE_VERSION=${STYLE_VERSION} sh -x ./build.sh

maven:
	mvn clean
	mvn package -Dstyle.version=${STYLE_VERSION} -Dbootstrap.version=${BOOTSTRAP_VERSION} -Pcss-with-bootstrap
	mvn package -Dstyle.version=${STYLE_VERSION} -Dbootstrap.version=${BOOTSTRAP_VERSION} -Pless-with-bootstrap
	mvn package -Dstyle.version=${STYLE_VERSION} -Dbootstrap.version=${BOOTSTRAP_VERSION} -Pless-without-bootstrap

deploy:
	BOOTSTRAP_VER=${BOOTSTRAP_VERSION} STYLE_VERSION=${STYLE_VERSION} sh -c "./src/main/script/maven-deploy.sh --settings .maven-settings.xml"

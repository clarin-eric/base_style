#/bin/sh
set -e

PLUGIN="org.apache.maven.plugins:maven-deploy-plugin:2.8.2"
REPOSITORY_URL_SNAPSHOT=https://nexus.clarin.eu/content/repositories/clarin-snapshot
REPOSITORY_URL_STABLE=https://nexus.clarin.eu/content/repositories/Clarin

#from env
#STYLE_VERSION=0.1.2

if echo "${STYLE_VERSION}" | grep -q "SNAPSHOT"
then
	echo "Detected SNAPSHOT version"
	REPOSITORY="CLARIN-Snapshot"
	REPOSITORY_URL=${REPOSITORY_URL_SNAPSHOT}
else
	echo "Detected NON-SNAPSHOT version"
	REPOSITORY="CLARIN"
	REPOSITORY_URL=${REPOSITORY_URL_STABLE}
fi

echo "Repository: ${REPOSITORY}" 
echo "URL: ${REPOSITORY_URL}" 

mvn ${PLUGIN}:deploy-file \
	-Durl=${REPOSITORY_URL} \
	-DrepositoryId=${REPOSITORY} \
	-Dfile=target-css-with-bootstrap/base-style-${STYLE_VERSION}.jar \
	-Dclassifier=css-with-bootstrap \
	-Dversion=${STYLE_VERSION} \
	-DpomFile=pom.xml \
	-Dfiles=target-less-with-bootstrap/base-style-${STYLE_VERSION}-less-with-bootstrap.jar,target-less-without-bootstrap/base-style-${STYLE_VERSION}-less-without-bootstrap.jar \
	-Dclassifiers=less-with-bootstrap,less-without-bootstrap \
	-Dtypes=jar,jar \
	$@

#!/usr/bin/env zsh

JAR=$(echo /opt/homebrew/Cellar/jdtls/**/org.eclipse.equinox.launcher_*.jar)
CONFIG=$(echo /opt/homebrew/Cellar/jdtls/**/config_mac)
PROJECT=$1

export GRADLE_HOME=/opt/homebrew/bin/gradle

DEPENDENCIES="$HOME/.config/nvim/lua/custom/dependencies"
LOMBOK="$DEPENDENCIES/lombok.jar"

if [[ ! -d $DEPENDENCIES ]]; then
  echo "No dependencies dir, creating..."
  mkdir -p $DEPENDENCIES
fi

if [[ ! -f $LOMBOK ]]; then
  echo "No lombok.jar, downloading..."
  curl -o $LOMBOK https://projectlombok.org/downloads/lombok.jar
fi

java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -javaagent:"$LOMBOK" \
  -Xbootclasspath/a:"$LOMBOK" \
  -jar $(echo $JAR) \
  -configuration $(echo $CONFIG) \
   -data "$HOME/development/.eclipse/workspace/$PROJECT" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED


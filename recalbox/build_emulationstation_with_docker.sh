#!/bin/bash
# Put this script to : /home/ark/recalbox-rpi4_64/scripts/linux/build_emulationstation.sh

# Quick'n'dirty checks
if [[ -z "$ARCH" ]] ; then
  inferred_arch=$(basename $(pwd) | sed -nr 's/^recalbox-(.+)/\1/p')
  if [[ -f configs/recalbox-${inferred_arch}_defconfig ]]; then
    ARCH=${inferred_arch}
  else
    echo "You must set the ARCH variable (we could not infer it from directory name)." >&2
    exit 1
  fi
fi

NPM_PREFIX_OUTPUT_PATH="`pwd`/output/build/.npm"
mkdir -p "$NPM_PREFIX_OUTPUT_PATH" "${PWD}/dl" "${PWD}/host"

docker run -ti --rm --security-opt seccomp=unconfined \
	-w="$(pwd)" \
	-v "$(pwd):$(pwd)" \
	-v "$NPM_PREFIX_OUTPUT_PATH:/.npm" \
	-v "${PWD}/dl:/share/dl" \
	-v "${PWD}/host:/share/host" \
	-e "ARCH=${ARCH}" \
	-e "PACKAGE=${PACKAGE}" \
  -e "TZ=Asia/Jakarta" \
	-e "RECALBOX_VERSION=${RECALBOX_VERSION:-9.1-Pulstar}" \
	-e "GITLAB_TOKEN_THEMES=${GITLAB_TOKEN_THEMES}" \
	-e "GITLAB_TOKEN_BEEBEM=${GITLAB_TOKEN_BEEBEM}" \
	-e "GITLAB_TOKEN_RB5000=${GITLAB_TOKEN_RB5000}" \
	--user="`id -u`:`id -g`" \
	"recalbox-dev" touch projects/frontend/es-app/src/guis/menus/GuiMenuBase.cpp && \
    rsync -vau --chmod=u=rwX,go=rX  --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/ark/recalbox-rpi4_64/buildroot/../projects/frontend/ /home/ark/recalbox-rpi4_64/output/build/recalbox-emulationstation2-custom && \
    cd /home/ark/recalbox-rpi4_64/output/build/recalbox-emulationstation2-custom && \
    make && \
    ../../host/aarch64-buildroot-linux-gnu/bin/strip -s emulationstation

#!/bin/bash

BASE=$(pwd)
ARM=$BASE/arm
AMD=$BASE/amd
PYFILE=$BASE/python/convert.py

# ──────────────────────────────────────────────────────────────────────────
# ARM build

cp $PYFILE $ARM/convert.py
cd $ARM
docker build -t dkllrjr/csgtostep:latest-arm64 --build-arg ARCH=arm64 .
rm $ARM/convert.py
docker push dkllrjr/csgtostep:latest-arm64

# ──────────────────────────────────────────────────────────────────────────
# AMD build

cp $PYFILE $AMD/convert.py
cd $AMD
docker build -t dkllrjr/csgtostep:latest-amd64 --build-arg ARCH=amd64 .
rm $AMD/convert.py
docker push dkllrjr/csgtostep:latest-amd64

# ──────────────────────────────────────────────────────────────────────────
# Docker manifest

cd $BASE
docker manifest rm dkllrjr/csgtostep:latest
docker manifest create dkllrjr/csgtostep:latest --amend dkllrjr/csgtostep:latest-arm64 --amend dkllrjr/csgtostep:latest-amd64
docker manifest push dkllrjr/csgtostep:latest

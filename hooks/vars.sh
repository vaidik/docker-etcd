#!/bin/bash

export VARS='
VERSION=3.3.1 BASE_IMAGE=debian:stretch-slim BASE_IMAGE_TAG="" EXTRA_TAGS="3.3"
VERSION=3.3.1 BASE_IMAGE=alpine:latest BASE_IMAGE_TAG=alpine EXTRA_TAGS="3.3-alpine"
VERSION=3.2.19 BASE_IMAGE=debian:stretch-slim BASE_IMAGE_TAG="" EXTRA_TAGS="latest;3.2"
VERSION=3.2.19 BASE_IMAGE=alpine:latest BASE_IMAGE_TAG=alpine EXTRA_TAGS="latest-alpine;3.2-alpine"
'

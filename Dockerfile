# Copyright Zhigui.com. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

FROM node:8.12 AS builder

MAINTAINER tailinzhang1993@gmail.com

RUN mkdir -p /usr/caliper/packages
COPY package.json /usr/caliper
COPY lerna.json /usr/caliper
COPY packages /usr/caliper/packages

RUN cd /usr/caliper && npm install && echo "y" | npm run repoclean && npm run bootstrap

# Create a minimized Docker mirror
FROM alpine AS prod

RUN apk add --no-cache --update nodejs nodejs-npm
COPY --from=builder /usr/caliper /usr/caliper

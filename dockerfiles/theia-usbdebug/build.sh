#!/bin/bash
#
# Copyright (c) 2018 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#

base_dir=$(cd "$(dirname "$0")"; pwd)
. "${base_dir}"/../build.include


if [ ! -d "${base_dir}/theia" ]; then
  echo "${ERROR}Have you cloned theia into ${base_dir}/theia from https://github.com/theia-ide/theia?"
  exit 2
fi

if [ ! -f "${base_dir}/theia/examples/browser/webpack.config.js" ]; then
  echo "${ERROR}Have you build theia in ${base_dir}/theia by running yarn (see https://github.com/theia-ide/theia/blob/master/doc/Developing.md#quick-start)?"
  exit 2
fi

init --name:theia-usbdebug "$@"
build

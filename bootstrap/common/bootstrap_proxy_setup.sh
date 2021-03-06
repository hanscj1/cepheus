#!/bin/bash
#
# Copyright 2017, LambdaStack
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Exit immediately if anything goes wrong, instead of making things worse.
set -e

if [ ! -z "$BOOTSTRAP_HTTP_PROXY" ]; then
  export http_proxy=${BOOTSTRAP_HTTP_PROXY}

  curl -s --connect-timeout 10 http://www.google.com > /dev/null && true
  if [[ $? != 0 ]]; then
    echo "Error: proxy $BOOTSTRAP_HTTP_PROXY non-functional for HTTP requests" >&2
    exit 1
  fi
fi

if [ ! -z "$BOOTSTRAP_HTTPS_PROXY" ]; then
  export https_proxy=${BOOTSTRAP_HTTPS_PROXY}
  curl -s --connect-timeout 10 https://github.com > /dev/null && true
  if [[ $? != 0 ]]; then
    echo "Error: proxy $BOOTSTRAP_HTTPS_PROXY non-functional for HTTPS requests" >&2
    exit 1
  fi
fi

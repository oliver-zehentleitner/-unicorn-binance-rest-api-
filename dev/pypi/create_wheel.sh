#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#
# File: pypi/create_wheel.sh
#
# Part of ‘UNICORN Binance REST API’
# Project website: https://www.lucit.tech/unicorn-binance-rest-api.html
# Github: https://github.com/LUCIT-Systems-and-Development/unicorn-binance-rest-api
# Documentation: https://unicorn-binance-rest-api.docs.lucit.tech
# PyPI: https://pypi.org/project/unicorn-binance-rest-api
# LUCIT Online Shop: https://shop.lucit.services/software
#
# License: LSOSL - LUCIT Synergetic Open Source License
# https://github.com/LUCIT-Systems-and-Development/unicorn-binance-rest-api/blob/master/LICENSE
#
# Author: LUCIT Systems and Development
#
# Copyright (c) 2017-2021, MIT License, Sam McHardy (https://github.com/sammchardy)
# Copyright (c) 2021-2023, LSOSL License, LUCIT Systems and Development (https://www.lucit.tech)
# All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish, dis-
# tribute, sublicense, and/or sell copies of the Software, and to permit
# persons to whom the Software is furnished to do so, subject to the fol-
# lowing conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL-
# ITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
# SHALL THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.


security-check() {
    echo -n "Did you change the version in \`CHANGELOG.md\` and used \`dev/set_version.py\`? [yes|NO] "
    local SURE
    read SURE
    if [ "$SURE" != "yes" ]; then
        exit 1
    fi
    echo "https://github.com/LUCIT-Systems-and-Development/unicorn-binance-rest-api/actions/workflows/build_wheels.yml"
    echo "https://github.com/LUCIT-Systems-and-Development/unicorn-binance-rest-api/actions/workflows/build_conda.yml"
}

compile-check() {
    echo -n "Compile local? [yes|NO] "
    local SURE
    read SURE
    if [ "$SURE" != "yes" ]; then
        exit 1
    fi
    echo "ok, lets go ..."
    python3 setup.py bdist_wheel sdist
}

security-check
compile-check

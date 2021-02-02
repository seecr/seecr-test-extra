#!/bin/bash
## begin license ##
#
# "Meresco Testsupport" provides extra test tools.
#
# Copyright (C) 2019, 2021 Seecr (Seek You Too B.V.) https://seecr.nl
#
# This file is part of "Meresco Testsuport"
#
# "Meresco Testsuport" is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# "Meresco Testsuport" is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with "Meresco Testsuport"; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
## end license ##

set -e

rm -rf tmp build

python3 setup.py install --root tmp

export PYTHONPATH=`pwd`/tmp/usr/local/lib/`py3versions -d`/dist-packages
cp -r test tmp/test
#cp seecr/__init__.py $PYTHONPATH/seecr/
#cp seecr/test/__init__.py $PYTHONPATH/seecr/test/

set +e
(
    cd tmp/test
    ./alltests.sh
)
set -e

rm -rf tmp build

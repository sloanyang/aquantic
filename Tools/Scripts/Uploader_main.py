#!/usr/bin/python

import os
import json
import logging
import optparse
import time
import datetime
import sys

from Uploader import Uploader

def main():
    parser = optparse.OptionParser("usage: %prog [options] [result] [buildnumber] [webkitrevision]")
    parser.add_option("--platform", dest="platform")
    parser.add_option("--debug", action="store_const", const="debug", dest="configuration")
    parser.add_option("--release", action="store_const", const="release", dest="configuration")

    options, (result, buildnumber, webkitrevision, ) = parser.parse_args()

    server="10.1.47.72"
    port="8080"

    #create result.json file
    archiveDir = os.path.abspath(os.path.join(os.path.dirname(__file__)))
    with open(os.path.abspath(os.path.join(archiveDir, "sample.json")),'r') as f:
        newlines = []
        for line in f.readlines():
            newlines.append(line.replace('RESULT', result).
                            replace('BUILD_NUMBER', buildnumber).
                            replace('WEBKIT_REVISION', webkitrevision).
                            replace('TIMESTAMP',str(int(time.time()))) )

    with open(os.path.abspath( os.path.join(archiveDir, "result.json")) , 'w') as f:
        for line in newlines:
            f.write(line)

    uploader = Uploader(server, port)
    uploader.UploadJson(os.path.abspath( os.path.join(archiveDir, "result.json")) )
    os.remove(os.path.abspath( os.path.join(archiveDir, "result.json")) )

if __name__ == '__main__':
    sys.exit(main())

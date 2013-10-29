#!/usr/bin/python

import os
import json
import logging
import optparse
import time
import datetime
import sys
#from webkitpy.common import find_files
#from webkitpy.common.checkout.scm.detection import SCMDetector
#from webkitpy.common.config.urls import view_source_url
from webkitpy.common.host import Host
from webkitpy.common.net.file_uploader import FileUploader
#from webkitpy.performance_tests.perftest import PerfTestFactory
#from webkitpy.performance_tests.perftest import DEFAULT_TEST_RUNNER_COUNT

class Uploader(object):
    def __init__(self, server, port):
        self.test_results_server = "%s:%s" % (server, port)
        self._host = Host()

    def UploadJson(self, json_path, host_path="/api/test/report", file_uploader=FileUploader):
        url = "http://%s%s" % (self.test_results_server, host_path)
        print url
        uploader = file_uploader(url, 120)
        try:
            response = uploader.upload_single_text_file(self._host.filesystem, 'application/json', json_path)
        except Exception, error:
            print "Failed to upload JSON file to %s in 120s: %s" % (url, error)
            return False

        response_body = [line.strip('\n') for line in response]
        if response_body != ['OK']:
            print response_body
        print "JSON file uploaded to %s." % url
        return True

def main():
    parser = optparse.OptionParser("usage: %prog [options] [server] [port] [json_file]")
    parser.add_option("--platform", dest="platform")
    parser.add_option("--debug", action="store_const", const="debug", dest="configuration")
    parser.add_option("--release", action="store_const", const="release", dest="configuration")

    options, (server, port, json_file, ) = parser.parse_args()
#    archiveDir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "webkit", "WebKitBuild"))
    archiveDir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "Tools", "Scripts"))

    uploader = Uploader(server, port)
    uploader.UploadJson(os.path.abspath( os.path.join(archiveDir, json_file)) )

if __name__ == '__main__':
    sys.exit(main())

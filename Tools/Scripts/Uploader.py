#!/usr/bin/python

import os
import json
import logging
import optparse
import time
import datetime
import sys
from webkitpy.common.host import Host
from webkitpy.common.net.file_uploader import FileUploader

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



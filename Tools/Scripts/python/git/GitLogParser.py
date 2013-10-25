#!/usr/bin/env python
import subprocess

class GitLogParser:
	log = []

	def ParseLog(self, directory):
		GIT_COMMIT_FIELDS = ['id', 'author_name', 'author_email', 'date', 'message', 'blob']
		GIT_LOG_FORMAT = ['%H', '%an', '%ae', '%ad', '%s', '%b']

		GIT_LOG_FORMAT = '%x1f'.join(GIT_LOG_FORMAT) + '%x1e'

		p = subprocess.Popen('git log --format="%s"' % GIT_LOG_FORMAT, shell=True, stdout=subprocess.PIPE, cwd=directory)
		(log, _) = p.communicate()

		log = log.strip('\n\x1e').split("\x1e")
		log = [row.strip().split("\x1f") for row in log]
		self.log = [dict(zip(GIT_COMMIT_FIELDS, row)) for row in log]

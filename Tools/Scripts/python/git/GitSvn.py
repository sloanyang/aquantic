#!/usr/bin/env python

from git.GitLogParser import GitLogParser
import re

class GitSvn:
	log = []
	commitid = 0					#bad commitid

	def findrev(self, revision, directory):
		parser = GitLogParser()
		parser.ParseLog(directory)
		self.log = parser.log
		finding = True
		loop	= 0
		loopend = len(self.log)

		while finding:
			self.commitid = self.log[loop]['id']
			if self.log[loop]['blob'].splitlines():
				svnline = self.log[loop]['blob'].splitlines().pop()
			else:
				loop += 1
				continue

			svnnumber = svnline.split(' ')[1].split('@')[1]
			if svnnumber == revision:
				finding = False
			loop += 1

			if loop == loopend:
				finding = False
				self.commitid = 0
		

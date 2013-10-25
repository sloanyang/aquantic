#!/usr/bin/env python

from git.GitLogParser import GitLogParser
import re

class GitSvn:
	log = []
	commitid = 0					#bad commitid

	def findrev(self, revision):
		parser = GitLogParser()
		self.log = parser.ParseLog()
		finding = True
		loop	= 0
		while finding:
			print self.log[0]['blob']
			finding = False
			
			

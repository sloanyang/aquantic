from git.GitSvn import GitSvn
from optparse import OptionParser


def main():
	parser = OptionParser(usage="usage: %prog [options] filename",
                          version="%prog 1.0")
	parser.add_option("-a", "--action",
                      dest="action",
                      default="info",
                      help="git svn $action $revision $directory")

	parser.add_option("-r", "--revision",
                      dest="revision",
                      default="",
                      help="git svn $action $revision $directory",)

	parser.add_option("-d", "--directory",
                      dest="directory",
                      default="",
                      help="git svn $action $argument $directory",)


	(options, args) = parser.parse_args()

	gitsvn = GitSvn()

	if (options.action) == "find-rev":
		gitsvn.findrev(options.revision, options.directory)
		print gitsvn.commitid
	else:
		print "unsupported"

if __name__ == '__main__':
	main()

from git.GitSvn import GitSvn
from optparse import OptionParser


def main():
	parser = OptionParser(usage="usage: %prog [options] filename",
                          version="%prog 1.0")
	parser.add_option("-a", "--action",
                      dest="action",
                      default="info",
                      help="git svn $action $argument")

	parser.add_option("-g", "--argument",
                      dest="argument",
                      default="",
                      help="git svn $action $argument",)

	(options, args) = parser.parse_args()

	gitsvn = GitSvn()

	if (options.action) == "find-rev":
		gitsvn.findrev(options.argument)
	else:
		print "unsupported"

if __name__ == '__main__':
	main()

import sys       
import subprocess
import re

# Calls the R system specifying that commands come from file commands.R
# The commands.R provided with this assignment will read the file named
# data and will output a histogram of that data to the file pageshist.pdf
def runR( ):
    res = subprocess.call(['R', '-f', 'commands.R'])

# log2hist analyzes a log file to calculate the total number of pages
# printed by each user during the period represented by this log file,
# and uses R to produce a pdf file pageshist.pdf showing a histogram
# of these totals.  logfilename is a string which is the name of the
# log file to analyze.
#
def log2hist(logfilename):
    # fill in your code here
	filelog = open(logfilename, 'r')

	userList = {}

	syntax = 'user:\s+([0-9a-z]+)\s+.*pages:\s+(\d+)(\s+|$)'

	syn = re.compile(syntax)

	readfile = filelog.read()

	for line in re.finditer(syn, readfile):

		user = line.group(1)
		printpageCount = line.group(2)

		if user in userList:
			userList[user] += int(printpageCount)
		else:
			userList[user] = int(printpageCount)

	data = open("data", 'w+')

	for printpageCount in userList.values():
		data.write('%d\n' % printpageCount)

	data.close()

	filelog.close()

	runR()
	return

if __name__ == '__main__':
    log2hist(sys.argv[1])   # get the log file name from command line

# line above may be changed to log2hist("log") to make the file name
#    always be log


# -*- coding: utf-8 -*-
#! /usr/bin/python

import os
import sys
import datetime
import random
import time

result = os.popen("git log").read()
print result

result_array = result.split('\n')

id_lists = []

for x in result_array:
	if x.find('commit') == 0:
		id_lists.append(x[7:48])

def validate(date_text):
	try:
        	datetime.datetime.strptime(date_text, '%Y-%m-%d')
	except ValueError:
        	return False
	else:
		return True
while True:
	start_date_entry = raw_input('Enter a start date in YYYY-MM-DD format')
	now = datetime.datetime.now()
	if validate(start_date_entry) == False:
		print("Invalid date type!")
		pass
	else:
		start_year, start_month, start_day = map(int, start_date_entry.split('-'))
		start_date = datetime.datetime(start_year, start_month, start_day, 0, 0, 0)
		if str(start_date) > str(now):
			print("date is larger than today!")
			pass
		else:
			break

while True:
	end_date_entry = raw_input('Enter a end date in YYYY-MM-DD format')
	if validate(end_date_entry) == False:
		print("Invalid date type!")
		pass
	else:
		end_year, end_month, end_day = map(int, end_date_entry.split('-'))
		end_date = datetime.datetime(end_year, end_month, end_day, 23, 59, 59)
		if str(end_date) > str(now):
			print("date is larger than today!")
			pass
		elif str(end_date) < str(start_date):
			print("end_date is smaller than start_date!")
			pass
		else:
			break
def strTimeProp(start, end, format, prop):
    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))


def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y-%m-%d %H:%M:%S', prop)

time_lists = []
for s in id_lists:
	time_lists.append(randomDate(str(start_date), str(end_date), random.random()))
time_lists = sorted(time_lists, reverse=True)

zipped_list = zip(id_lists, time_lists)
for x, y in zipped_list:
	command_str = ''
	date_time = y.split(' ')
	command_str = 'git commit --amend --date="' + str(date_time[0]) + 'T' + str(date_time[1]) + '±00:01" -C ' + str(x)
	os.system(command_str)
#os.system('git filter-branch -f --env-filter \'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"' -- --all')


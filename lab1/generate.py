#!/usr/bin/env python

########################################################################################
# This is a skeleton planning problem instance generator
# for the UAV domain in the TDDD48 Automated Planning course.
# Ask your lab assistant if you have any questions.
#
# The intention is that we provide a number of functions
# to help you *IF* you want to create a problem generator.
# The course does not require you to do so and you are free
# to define problem instances manually if you prefer.
#
# You mainly have to change the parts marked as TODO.
#
# The problem generator skeleton is written in Python, because
# it is a reasonably modern language that does not require
# a tedious compilation phase, etc.
#
# If you haven't used Python before, don't worry: Neither had we.
# IMPORTANT: Python is sensitive to indentation!
# The body of a for loop is indented, for example.
#
########################################################################################


from optparse import OptionParser
import random
import math
import sys

########################################################################################
# Hard-coded options
########################################################################################

# Crates will have different contents, such as food and medicine.
# You can change this to generate other contents if you want.

crate_contents = ["food", "medicine"]

########################################################################################
# Random seed
########################################################################################

# Set seed to 0 if you want more predictability...
# random.seed(0);

########################################################################################
# Helper functions
########################################################################################

# We associate each location with x/y coordinates.  These coordinates
# won't actually be used explicitly in the domain, but we *will*
# eventually use them implicitly by using *distances* in order to
# calculate flight times.
#
# This function returns the euclidean distance between two locations.
# The locations are given via their integer index.  You won't have to
# use this other than indirectly through the flight cost function.
def distance(location_num1,location_num2):
	x1 = location_coords[location_num1][0]
	y1 = location_coords[location_num1][1]
	x2 = location_coords[location_num2][0]
	y2 = location_coords[location_num2][1]
	return math.sqrt((x1-x2)**2+(y1-y2)**2)

# This function returns the action cost of flying between two
# locations supplied by their integer indexes.  You can use this
# function when you extend the problem generator to generate action
# costs.
def flight_cost(location_num1,location_num2):
	return int(distance(location_num1,location_num2))+1	


# When you run this script you specify the *total* number of crates
# you want.  The function below determines randomly which crates
# will have a specific type of contents.  crates_with_contents[0]
# is a list of crates containing crate_contents[0] (in our
# example "food"), and so on.

def setup_crate_contents():
	num_crates_with_contents = []
	crates_left = options.crates
	for x in range(len(crate_contents)-1):
		num = random.randint(1,crates_left-(len(crate_contents)-x+1))
		num_crates_with_contents.append(num)
		crates_left = crates_left - num
	num_crates_with_contents.append(crates_left)
		
	print "Types\tQuantities"
	for x in range(len(num_crates_with_contents)):
		if num_crates_with_contents[x] > 0:
			print crate_contents[x]+"\t "+str(num_crates_with_contents[x])

	crates_with_contents = []
	counter = 1
	for x in range(len(crate_contents)):
		crates = []
		for y in range(num_crates_with_contents[x]):
			crates.append("crate" + str(counter))
			counter += 1
		crates_with_contents.append(crates)

	return crates_with_contents


	
# This function populates the location_coords list with an X and Y
# coordinate for each location.  You won't have to use this other than
# indirectly through the flight cost function.
def setup_location_coords():
	location_coords = [(0,0)] # For the depot
	for x in range(1,options.locations+1):
		location_coords.append((random.randint(1,200),random.randint(1,200)))
	print "Location positions",location_coords	
	return location_coords

# This function generates a random set of goals.
# After you run this, need[personid][contentid] is true if and only if
# the goal is for the person to have a crate with the specified content.
# You will use this to create goal statements in PDDL.
def setup_person_needs():
	need = [ [ False for i in range(len(crate_contents)) ] for j in range(options.persons) ]
	goals_per_contents = [0 for i in range(len(crate_contents)) ]

	for goalnum in range(options.goals):
		generated = False
		while not generated:
			rand_person = random.randint(0,options.persons-1)
			rand_content = random.randint(0,len(crate_contents)-1)
			# If we have enough crates with that content
			# and the person doesn't already need that content
			if (goals_per_contents[rand_content] < len(crates_with_contents[rand_content])
			    and not need[rand_person][rand_content]):
				need[rand_person][rand_content] = True
				goals_per_contents[rand_content] += 1
				generated = True
	return need
				
########################################################################################
# Main program
########################################################################################
		
# Take in all arguments and print them to standard output
		
parser = OptionParser(usage='python generate [-help] options...')
parser.add_option('-u', '--uavs',metavar='NUM', dest='uavs',action='store',type=int, help='the number of UAVs') 
parser.add_option('-r', '--carriers', metavar='NUM', type=int,dest='carriers', help='the number of carriers, for later labs')
parser.add_option('-l', '--locations', metavar='NUM', type=int,dest='locations', help='the number of locations apart from the depot ')
parser.add_option('-p', '--persons', metavar='NUM', type=int,dest='persons', help='the number of persons')
parser.add_option('-c', '--crates', metavar='NUM', type=int,dest='crates', help='the number of crates available')
parser.add_option('-g', '--goals', metavar='NUM', type=int,dest='goals', help='the number of crates assigned in the goal')

(options,args) = parser.parse_args()

if (options.uavs == None or options.carriers == None or
    options.locations == None or options.persons == None or
    options.crates == None or options.goals == None):
	print "You must specify all options (use -help for help)"
	sys.exit(1)

print "UAVs\t\t", options.uavs
print "Carriers\t",options.carriers
print "Locations\t", options.locations	
print "Persons\t\t",options.persons
print "Crates\t\t", options.crates
print "Goals\t\t",options.goals

# Setup all lists of objects

# These lists contain the names of all UAVs, locations, and so on.

uav = []
person = []
crate = []
carrier = []
location = []

for x in range(options.locations):
	location.append("loc"+str(x+1))
for x in range(options.uavs):
	uav.append("uav"+str(x+1))
for x in range(options.persons):
	person.append("person"+str(x+1))
for x in range(options.crates):
	crate.append("crate"+str(x+1))
for x in range(options.carriers):
	carrier.append("carrier"+str(x+1))

# Determine the set of crates for each content.
# If crate_contents[0] is "food",
# then crates_with_contents[0] is a list
# containing the names of all crates that contain food.
crates_with_contents = setup_crate_contents()

# Generates coordinates for each location.
# You will only use this indirectly,
# through the flight_cost() function in lab 2.
location_coords = setup_location_coords()

# Determine which types of content each person needs.
# If person[0] is "person0",
# and crate_contents[1] is "medicine",
# then needs[0][1] is true iff person0 needs medicine.
need = setup_person_needs()

# Define a problem name
problem_name ="uav_problem_"+str(options.uavs)+"_"+str(options.carriers)+\
"_"+str(options.locations)+"_"+str(options.persons)+"_"+str(options.crates)+\
"_"+str(len(crate_contents))

# Open output file
f = open(problem_name+".pddl", 'w')
print f

# Write the initial part of the problem

f.write("(define (problem "+problem_name+")\n")
f.write("(:domain uav-domain)\n")
f.write("(:objects\n")

######################################################################
# Write objects

# TODO: Change the type names below (uav, location, ...)
# to suit your domain.

for x in uav:
	f.write("\t" + x + " - uav\n")

for x in location:
	f.write("\t" + x + " - location\n")

for x in crate:
	f.write("\t" + x + " - crate\n")


for x in person:
	f.write("\t" + x + " - person\n")

for x in carrier:
	f.write("\t" + x + " - carrier\n")
	
f.write(")\n")

######################################################################
# Generate an initial state

f.write("(:init\n")

# TODO: Initialize all facts here!
for x in uav:
	f.write("\n");
	f.write("\t(at depot " + x + ")\n")
	f.write("\t(free "+ x + ")\n")

for i,x in enumerate(person):
	n = need[i]
	for j,item in enumerate(n):
		if item: 
			f.write("\t(needs " + x + " " + crate_contents[j] + ")\n")

	f.write("\t(at " + location[random.randint(0, len(location)-1)] + " " + x + ")\n")

for i,cont in enumerate(crates_with_contents):
	for crat in cont:
		f.write("\t(has " + crat + " " + crate_contents[i] + ")\n")

for cr in crate:
	f.write("\t(at depot " + cr + ")\n")

f.write(")\n")

######################################################################
# Write Goals

f.write("(:goal (and\n")

# All UAVs should end up at the depot
for x in uav:
	f.write("\n");
	# TODO: Write a goal that the UAV x is at the depot
	f.write("\t(at depot " + x + ")\n")

f.write("\n")

for x in range(options.persons):
	for y in range(len(crate_contents)):
		if need[x][y]:
			person_name = person[x]
			content_name = crate_contents[y]
			# TODO: write a goal that the person needs a crate
			# with this specific content
			f.write("\t(has " + person_name + " " + content_name + ")\n")

f.write("\t))\n")
f.write(")\n")

## All scripts should start with some information about what the script does,
## who made it, and when. This is helpful when you find a random script on
## your computer but don't know what it is for. Or, when you wrote something
## and return to it years later -- what the heck did this script do? Did I write
## this?This script is the first of a few scripts providing some helpful R tips
## to undergrads. This script discusses how to install packages and load
## libraries and was codes by Kim Savides in February 2026.

## Also, note that this block of text is broken up on many lines. Different
## people have different screen sizes, so we try to keep code or especially text
## to only so many characters per line. R might have a vertical line here   -->
## that you can just barley see. This is a helpful guide. You will also see that
## the text here is a different color than the lines below and starts with a #.
## The # tells R this line is not code, its a "comment". Different colors indicate
## different things in R. The color depends on your theme in the settings.

## It is also helpful to have an outline of your script to you can know at a glance what it does:


## OUTLINE:
##
##   1. Install a few useful packages
##   2. Load some libraries
##   3. Run some functions




###################################################
#  1. Install Packages                            #
###################################################

# I like to break up by scripts into sections with these block headers, they are easy to find.

# Lets install the package "dplyr". dplyr has lots of data cleaning tools in it.
# Its the first thing I uses 99% of the time I open R.
install.packages("dplyr")         # the package name MUST be in quotes, to run hit ctrl+enter
install.packages("auk")           # auk is used to process raw ebird data, but also holds the ebird taxonomy files

# install.packages() is a function. And the package name goes in the parentheses in quotes
# You may get a message that you need to install a bunch of other packages. That's
# totally fine and expected. Packages depend on other packages. Go ahead and install all.
# You may be asked to restart R. That's ok to, go ahead and do that.



###################################################
#  2. Load libraries                              #
###################################################

# Ok we installed some packages. But the things in those are not active yet.
# We load these "libraries" every time we open R. This is done calling library()

# Load the dplyr library
library(dplyr)                     # dplyr here is not in quotes, messages/warnings in the console are usually fine

# Load the auk library
library(auk)




###################################################
#  3. Run some functions                          #
###################################################

# Lets ask auk to grab the ebird taxonomy for us from the database in the cloud
# Don't worry, auk know how to do this, we just need to run the function

taxa <- get_ebird_taxonomy()    # This runs the function to get the taxonomy file, and puts it in the object "taxa"

# Look in your environment pane (top right). There's now an "object" called taxa, click on it.
# Its a table that has all the ebird taxonomy in it! But that's kind fo a lot of data.
# Lets say I just want the lines for Black-throated Blue Warbler and Labrador Duck,
# I need to know what their species code is for some reason. We can do this using
# the filter() function from dplyr!


warbler <- taxa %>% filter(common_name == "Black-throated Blue Warbler")
duck <- taxa %>% filter(common_name == "Labrador Duck")

# In those lines, we make an object (warbler) by running the code to the right.
# That code takes the object "taxa" (which is all our data)...
#   Then puts that through the pipe "%>%" to the function filter (which filters the data)...
#      Then filter is going to look in the column "common_name"...
#          And find any lines where the text matches (==) "Black-throated Blue Warbler".
#              Then any lines that match will be put in "warbler", in this case only one line matches









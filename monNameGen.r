# I picked up this list of names from gamepedia
# http://diablo.gamepedia.com/Unique_Monsters_(Diablo_II)
# Wanted to make a random generator for naming purposes
# saved the table as a .csv, "gamepedia_names.csv",
# split it into other .csv's as well



# let's load in the csv 
pref <- scan(file="prefixes.csv", what="character", skip=1)
suff <- scan(file="suffixes.csv", what="character", skip=1)
appel <- scan(file="appelation.csv", what="character", skip=1)

# make a random name
makeName <- function(pre = sample(pref, 1),
                     suf = sample(suff, 1),
                     app = sample(appel, 1)
                     ){

    paste(pre,
      suf,
      " ",
      app,
      sep=""
      )
    
}

# let's make a bunch of them
names.vec <- replicate(n=99, expr=makeName())

# like pref = "Bone", as well as suf = "Froth"
# make a bunch of perms on that

bone.vec <- replicate(n=60, makeName(pre="Bone"))
froth.vec <- replicate(n=60, makeName(suf="Froth"))

# just want to see all the ways that "bone" and "froth" can go with 
# the suff or pref

bonel.vec <- paste("Bone", suff, sep="")
frothl.vec <- paste(pref, "Froth", sep="")

# "Maw" is a pretty sweet suffix
mawl.vec <- paste(pref, "Maw", sep="")

# they forgot "Ice", "Frost"

frost.vec <- paste("Frost", suff, sep="")
ice.vec <- paste("Ice", suff, sep="")

# huh, also "Hate"
hate.vec <- paste("Hate", suff, sep="")
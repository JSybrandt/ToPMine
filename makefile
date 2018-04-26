# Note: Added by Justin
# Requires: javac, wget, unzip

CC=javac
S=TopicalPhrases/src
B=TopicalPhrases/bin
E=external

DIRS = DataPreparation \
       phraseMining \
	     topicmodel \
	     unStem

#urls for extern dependencies

SNOWBALL_URL=http://www.java2s.com/Code/JarDownload/snowball/snowball-1.0.jar.zip
MALLET_URL=http://www.java2s.com/Code/JarDownload/mallet/mallet-2.0.7.jar.zip
MALLET_DEPS_URL=http://www.java2s.com/Code/JarDownload/mallet/mallet-deps.jar.zip

#java classpath is split on colons
CLASSPATH = $E/snowball.jar:$E/mallet.jar:$E/mallet_deps.jar

#replace colons with spaces for extern dependencies
EXTERNS=$(subst :, , $(CLASSPATH))

CLASSDIRS= $(addprefix $B/, $(DIRS))

all: $(CLASSDIRS)

# build each proj dir
$B/%: $S/% $(EXTERNS)
	mkdir -p $@ ; \
	$(CC) -classpath $(CLASSPATH) -d $@/../ $(wildcard $</*.java)

$E/snowball.jar:
	wget -O $@.zip $(SNOWBALL_URL) ; unzip -p $@.zip > $@ ; rm -f $@.zip

$E/mallet.jar:
	wget -O $@.zip $(MALLET_URL) ; unzip -p $@.zip > $@ ; rm -f $@.zip

$E/mallet_deps.jar:
	wget -O $@.zip $(MALLET_DEPS_URL) ; unzip -p $@.zip > $@ ; rm -f $@.zip

clean:
	rm -rf $(wildcard $B/*)
	rm -rf $(wildcard $E/*)

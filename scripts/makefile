# Bundles both old (<7.70) and new (7.70) prefab versions
all: build-folder build-gen build-new build-old

# Build folder setup
build-folder:
	mkdir build

# Specific packages
build-gen: skygenerator-build
build-new: prefabs-build customshaperules-build stretchedmap-build prefaberrorlogger-build
build-old: prefabs-build-old customshaperules-build-old stretchedmap-build-old prefaberrorlogger-build-old

# Packaging for version-independant modules
skygenerator-build:
	cd ../src/modules-paramskygenerator; zip -vr ../../scripts/build/ObFab-SkyGen.pk3 *

# Setup and packaging for new 7.70 version
prefabs-setup:
	mkdir -vp build/files/new/games/doom/fabs
	cp -vr ../src/fabs-obfab/prefabs/* build/files/new/games/doom/fabs/
	cp -vr ../src/fabs-obfab/games/doom/themes.lua build/files/new/games/doom/

prefabs-build: prefabs-setup
	cd build/files/new; zip -vr ../../ObFab-Prefabs-7.70.pk3 *

customshaperules-build:
	cd ../src/script-customshaperules-7.70; zip -vr ../../scripts/build/ObFab-ShapeRules-7.70.pk3 *

stretchedmap-build:
	cd ../src/script-stretchedoutmapsize-7.70; zip -vr ../../scripts/build/ObFab-StretchedMap-7.70.pk3 *

prefaberrorlogger-build:
	cd ../src/script-prefaberrorlogger-7.70; zip -vr ../../scripts/build/ObFab-PrefabErrorLogger-7.70.pk3 *

# Setup and packaging for old 7.59 version
prefabs-setup-old:
	mkdir -vp build/files/old/prefabs
	mkdir -vp build/files/old/games/doom
	cp -vr ../src/fabs-obfab/prefabs/* build/files/old/prefabs/
	cp -vr ../src/fabs-obfab/games/doom/themes.lua build/files/old/games/doom/

prefabs-build-old: prefabs-setup-old
	cd build/files/old; zip -vr ../../ObFab-Prefabs-7.59.pk3 *

customshaperules-build-old:
	cd ../src/script-customshaperules-Glaices7.59; zip -vr ../../scripts/build/ObFab-ShapeRules-7.59.pk3 *

stretchedmap-build-old:
	cd ../src/script-stretchedoutmapsize-Glaices7.59; zip -vr ../../scripts/build/ObFab-StretchedMap-7.59.pk3 *

prefaberrorlogger-build-old:
	cd ../src/script-prefaberrorlogger-Glaices7.59; zip -vr ../../scripts/build/ObFab-PrefabErrorLogger-7.59.pk3 *

# Clean
clean:
	rm -vr build/

# Filter the files through a normalizer
normalize:
	./normalize-source.sh

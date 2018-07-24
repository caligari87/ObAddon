# Bundles both old (<7.70) and new (7.70) prefab versions
all: prefabs-build skygenerator-build customshaperules-build prefaberrorlogger-build

# Sets up file tree for old addon format
prefabs-setup:
	mkdir -p build/files/new/games/doom/fabs
	cp -r -v ../src/fabs-obfab/prefabs/* build/files/new/games/doom/fabs
	cp -r -v ../src/fabs-obfab/games/doom/themes.lua build/files/new/games/doom/themes

prefabs-build: prefabs-setup
	cd build/files/new; zip -r ../../ObFab_Prefabs-7.70.pk3 *

skygenerator-build:
	cd ../src/modules-paramskygenerator; zip -r ../../scripts/build/ObFab-SkyGen-7.70.pk3 *

customshaperules-build:
	cd ../src/script-customshaperules-7.70; zip -r ../../scripts/build/ObFab-ShapeRules-7.70.pk3 *

prefaberrorlogger-build:
	cd ../src/script-prefaberrorlogger-7.70; zip -r ../../scripts/build/ObFab-PrefabErrorLogger-7.70.pk3 *

clean:
	rm -r build/
# Bundles both old (<7.70) and new (7.70) prefab versions
all: prefabs-build-old-addon prefabs-build-new-addon clean-lite
	
# Sets up file tree for old addon format
prefabs-setup-old-addon-structure:
	mkdir -p build/files/old/prefabs/
	cp -r -v ../src/prefabs/* build/files/old/prefabs
	cp -r -v ../src/games/doom/themes.lua build/files/new/games/doom

prefabs-setup-new-addon-structure:
	mkdir -p build/files/new/games/doom/fabs
	cp -r -v ../src/prefabs/* build/files/new/games/doom/fabs
	cp -r -v ../src/games/doom/themes.lua build/files/new/games/doom
	
prefabs-build-old-addon: prefabs-setup-old-addon-structure
	cd build/files/old; zip -r ../../ObFab_Glaice7.59.pk3 *

prefabs-build-new-addon: prefabs-setup-new-addon-structure
	cd build/files/new; zip -r ../../ObFab_7.70.pk3 *

scripts-build-parameteredskygenerator:
	mkdir -p build/files/TMP/
	cp -v ..src/modules/sky_generator.lua build/files/TMP/modules/
	cd build/files/TMP; zip -r ../../GTDParameteredSkyGenerator.pk3 *

scripts-build-customshaperules:
	mkdir -p build/files/TMP/
	mkdir -p build/files/TMP2/
	cp -v ../src/scripts-all/rules.lua build/files/TMP/scripts/
	cd build/files/TMP; zip -r ../../GTDCustomShapeRulesGlaices7.59.pk3 *	
	mv -v ..build/files/TMP/scripts/rules.lua build/files/TMP2/games/doom/shapes.lua
	cd build/files/TMP2; zip -r ../../GTDCustomShapeRules7.70.pk3 *

scripts-build-prefaberrorlogger:
	mkdir -p build/files/TMP/
	cp -v ../src/scripts-7.70/prefab.lua build/files/TMP/scripts/
	cp -v ../src/scripts-Glaices7.59/prefab.lua build/files/TMP2/scripts/
	cd build/files/TMP; zip -r ../../PrefabErrorLoggingGlaices7.59.pk3 *	
	cd build/files/TMP2; zip -r ../../PrefabErrorLogging7.70.pk3 *
	
clean-lite:
	rm -r build/files

clean:
	rm -r build/
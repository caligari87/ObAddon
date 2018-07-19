# Bundles both old (<7.70) and new (7.70) prefab versions
all: prefabs-build-old-addon prefabs-build-new-addon clean-lite

# Sets up file tree for old addon format
prefabs-setup-old-addon-structure:
	mkdir -p build/files/old/prefabs/
	cp -r -v ../src/prefabs/* build/files/old/prefabs

prefabs-setup-new-addon-structure:
	mkdir -p build/files/new/games/doom/fabs
	cp -r -v ../src/prefabs/* build/files/new/games/doom/fabs

prefabs-build-old-addon: prefabs-setup-old-addon-structure
	cd build/files/old; zip -r ../../ObFab_old.pk3 *

prefabs-build-new-addon: prefabs-setup-new-addon-structure
	cd build/files/new; zip -r ../../ObFab_new.pk3 *

clean-lite:
	rm -r build/files

clean:
	rm -r build/
# Bundles both old (<7.70) and new (7.70) prefab versions
all: obaddon-build

# Do the actual build
obaddon-build:
	mkdir -p build
	cd ../src; zip -vr ../scripts/build/obaddon.pk3 *

# Clean
clean:
	rm -vr build/

# Filter the files through a normalizer
normalize:
	./normalize-source.sh

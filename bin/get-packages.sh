#!/usr/bin/env sh
# Recursively runs "packages get" in all subdirectories of "packages".

# recursively iterate through subdirectories of "packages"
for dir in packages/*; do
	echo "Getting packages for $dir"
	if [ -d "$dir" ] && [ -f "$dir/pubspec.yaml" ]; then
		cd "$dir" || exit
		if grep -q "sdk: flutter" "pubspec.yaml"; then
			flutter pub get >/dev/null
		else
			dart pub get >/dev/null
		fi
		cd ../..
	fi
done

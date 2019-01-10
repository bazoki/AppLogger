#!/usr/bin/env bash
# DESCRIPTION: A simple shell script designed to fetch the latest version
# of the artifacts credential provider plugin for dotnet and
# install it into $HOME/.nuget/plugins.
# SEE: https://github.com/Microsoft/artifacts-credprovider/blob/master/README.md

cp  AppLogger/NuGet.config .

for i in `find . -name "*.nupkg" -type f`; do
	echo $i;
	output=$(dotnet nuget push $i -s test-feed -k anything; 2>&1)
	
	ret=$?

	if [[ $ret -eq 0 ]]; then
		echo 'No issues'
		echo OK
	else
		if [[ $output == *'Conflict - The feed already contains'* ]]; then
			echo 'issue - duplicate but it is okay'
			 echo OK
		else
			 echo FAIL
		fi
	fi

done

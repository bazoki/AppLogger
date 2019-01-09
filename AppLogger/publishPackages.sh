#!/usr/bin/env bash
# DESCRIPTION: A simple shell script designed to fetch the latest version
# of the artifacts credential provider plugin for dotnet and
# install it into $HOME/.nuget/plugins.
# SEE: https://github.com/Microsoft/artifacts-credprovider/blob/master/README.md

for i in `find . -name "*.nupkg" -type f`; do
	dotnet nuget push "$i" -s test-feed -k anything
done

# mango-package
Script(s) for packing mango.

# instructions

## linux

### debian

- download the mango source code in the form of a ".tar.gz" file. move it to the root directory of mango-package and rename it as "mango.tar.gz".

- in your shell, create an environment variable named "MANGO_VERSION" with the version number that you downloaded in the format of "X.X.X". in bash, you can run the command "export MANGO_VERSION=(version number goes here)"

- next run "./debian.sh" or "sh debian.sh". This will run the script. In the beginning of the script, you may see an text editor open. Save the file and close the editor (the file in question is named "debian/changelog"). After that, the script will continue on automatically.

- Hopefully, you should now have a functioning debian package.

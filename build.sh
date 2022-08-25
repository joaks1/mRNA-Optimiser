#! /bin/bash

set -e

# Get path to directory of this script
package_dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Clear out any previously compiled files
if [ -n "$(find "${package_dir}/pt" -name "*.class")" ]
then
    rm $(find "${package_dir}/pt" -name "*.class")
fi

(
    cd "$package_dir"
    javac pt/ua/ieeta/RNAmfeOpt/main/Main.java
    jar cvfm mRNAOptimiser.jar manifest.txt pt/ua/ieeta/RNAmfeOpt/*/*.class
)

# Clean up class files
rm $(find "${package_dir}/pt" -name "*.class")

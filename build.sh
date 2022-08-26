#! /bin/bash

set -e


# Get path to directory of this script
package_dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
src_dir="${package_dir}/pt"

# Function to remove compiled class files
clean_up() {
    if [ -n "$(find "$src_dir" -name "*.class")" ]
    then
        rm $(find "$src_dir" -name "*.class")
    fi
}
# Make sure we clean up class files on exit
trap clean_up EXIT

clean_up
(
    cd "$package_dir"
    # javac pt/ua/ieeta/RNAmfeOpt/main/Main.java
    javac pt/ua/ieeta/RNAmfeOpt/*/*.java
    jar cvfm mRNAOptimiser.jar manifest.txt pt/ua/ieeta/RNAmfeOpt/*/*.class
)

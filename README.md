This is a fork of
[Paulo Gaspar's mRNA-Optimiser](https://github.com/bioinformatics-ua/mRNA-Optimiser).
The purpose of this fork is to enable repeatable results by adding an option of
providing a seed for random number generation.

How to compile
==============

First, clone and `cd` into the repo.

    git clone https://github.com/joaks1/mRNA-Optimiser.git
    cd mRNA-Optimiser

You can use `conda` to create an environment with Java (you can skip these
steps if you want to use your own installation of Java.

    conda env create -f environment.yml
    conda activate mrna-optimiser

Lastly, simply run the build script

    ./build.sh

Now, you should be able to run mRNAOptimiser.jar using `-s` to specify a seed
to get identical results repeatedly

    java -jar mRNAOptimiser.jar -i 10 -s 3741515489481741212 GUCACGUACUGACGUACUGCAGUC


mRNA-Optimiser
==============

Console application to redesign mRNA nucleotide sequences (given as text strings) to enhance its secondary structure in terms of minimum free energy

**Usage**: `mRNAoptimizer [*options*] nucleotide_sequence`

Example usages:

        **mRNAoptimizer** GUCACGUACUGACGUACUGCAGUCA
        **mRNAoptimizer** -f sequence_file.txt
        **mRNAoptimizer** -f sequence_file.txt -b 100 -e 300 -o output.txt

**Options**:



- `-f inputFile`      Give input sequence as a file.

- `-o outputFile`     Output results to file (Default = standard output).

- `-b index`          Index of the first nucleotide of the start codon (default=1)

- `-e index`          Index of the last nucleotide of the stop codon (default = sequence size)

- `-d type`           Optimization type: 0 to maximize MFE (default) / 1 to minimize MFE

- `-t maxTime`        Maximum optimization time, in minutes (default = no limit).

- `-i iterations`     Number of iterations the algorithm runs. The more iterations the longer it will take, but results will usually be better (default = 4000)

- `-c codingTable`    Genetic Code Table to use(default=1) according to this list:
                  [http://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi](http://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi "http://www.ncbi.nlm.nih.gov/Taxonomy/Utils/wprintgc.cgi")

- `-q`                Don't output anything else than the resulting sequence.

- `-g`                Maintain the same GC content as the original sequence. With this option, the MFE optimization won't be as expressive.

- `-s seed`           Seed for random numbers.

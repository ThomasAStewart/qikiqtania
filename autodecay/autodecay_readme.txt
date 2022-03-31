# Notes on how to run AutoDecay
# Author: T.A.S.
# Date: Jan 2022

To run AutoDecay:
* create a folder with (1) your phylogeny [Here we use the strict consensus tree from parsimony analysis.], (2) your phylogenetic dataset (I simply delete the PAUP* commands from paup_runfile.nex), and (3) the AD.pl file.

* open terminal, ''cd' to that folder.
* run the command:
  > perl AD.pl -s tree_file_name.tre "bandb" [what is within the parentheses here defines the search strategy. It should match your original maximum parsimony search strategy].
* This will generate a new ".adc" file in the folder.

* in a new terminal window, go to the folder where the paup* program contained and run:
  > open paup*
* once in paup, run the following:
  > paup > execute /"your file path"/dataset.nex
  > paup > outgroup Megalichthys
  > paup > set maxtrees = 1000000
  > paup > execute /"your file path"/myStrictConsensustree.adc
* This willl generate a new ".log" file in the folder.
  
* switch back to original terminal window, which should still be in the directory containing thesefiles and run:
  > perl AD.pl -e myStrictConsensustree.adc 150 # The number here is the score of the strict consensus tree.

* a new tree file is generated and also a decay file (.dcy). The tree file, which has replaced your input tree file in the folder, can now be read like any other. The bremer values will be placed on the nodes.

# Notes on how to generate apolist
# Author: T.A.S.
# Date: Jan 2022


To generate information presented in Fig. S5 c:

* Create a new folder that contains: (1) tree from a previous phylogenetic analysis (Here we use the strict consensus tree from our parsimony analysis). (2) a nexus file with the phylogenetic dataset (I copy the paup_runfile.nex and then delete tail end of the file, everything after 'assumptions'.) 
* In terminal, 'cd' to the folder containing the program paup*. In my case, I keep it in a folder higher in the hierarchy of my local R.proj. Open paup* 
  > open paup*
* Once open, run the following:
  > paup> execute paup_runfile_edit.nex [your phylogenetic dataset. Note: when linking to a file in paup, it is simple to drag from finder and drop the full path]
  > paup> execute "myStrictConsensustree.tre" [your tree file]
  > paup> outgroup Megalichthys [name your outgroup]
  > paup> describetrees 1/apolist=yes
* I copy and paste the output in a text document (apolist_output.txt) and then go through and manually evaluate which characters are unequivocal (i.e, would be recovered under both AccTran or DelTran settings). These are what we present on the figure.
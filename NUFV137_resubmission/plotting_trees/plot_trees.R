# INTRODUCTION

# The purpose of this file is to make output tree files into PDFs.
# Notation and parameters for plotting function found here: https://www.rdocumentation.org/packages/ape/versions/5.4-1/topics/plot.phylo

# by TAS on 2021.08.04


#install.packages("phylotate")
# initialize library ####
library(ape); library(phylotate)


# load trees ####
phy_strict <- read.nexus("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/parsimony/myStrictConsensustree.tre")
phy_strict <- ladderize(phy_strict, right = TRUE) # this organizes branching so it reads in a simple, ladderized way.
phy_strict <- root(phy_strict, outgroup = "Megalichthys", resolve.root = TRUE)

phy_adams <- read.nexus("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/parsimony/myAdamsonsensustree.tre")
phy_adams <- ladderize(phy_adams, right = TRUE) # this organizes the majority consensus tree so that branching follows a simple, ladderized pattern
phy_adams <- root(phy_adams, outgroup = "Megalichthys", resolve.root = TRUE)

phy_boot <- read.nexus("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/parsimony/NUFV137_phylogenetic_analysis_main_ms_bootstrap500_con.tre")
phy_boot <- ladderize(phy_boot, right = TRUE) # this organizes branching so it reads in a simple, ladderized way.
phy_boot$node.label <- round(as.numeric(phy_boot$node.label),0) # This rounds the bootstrap support values to one decimal place.
phy_boot <- root(phy_boot, outgroup = "Megalichthys", resolve.root = TRUE)

phy_bayesian <- read.nexus("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/bayesian/NUFV137_tree_all_mrb.con.tre")
phy_bayesian <- ladderize(phy_bayesian, right = TRUE) 
phy_bayesian <- root(phy_bayesian, outgroup = "Megalichthys", resolve.root = TRUE)

phy_decay <- read.nexus("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/autodecay/myStrictConsensustree.tre")
phy_decay <- ladderize(phy_decay, right = TRUE) 
phy_decay <- root(phy_decay, outgroup = "Megalichthys", resolve.root = TRUE)


# plot trees, save figure
pdf("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/plotting_trees/plot_all_Jan19.pdf", # File name 
    width = 15, height = 12)
layout(matrix(1:6, 2,3)) # assign number of plots and then organization: rows by columns
#layout(matrix(1:4, 1,4))

plot(phy_strict, type = "phylogram",
     no.margin=FALSE, # fill image space
     show.tip.label = TRUE, # include taxon names
     show.node.label = FALSE, # include internal support values
     edge.color = "black", # line color
     edge.width = 1, # line thickness
     label.offset=.5, # amount of separation between line and taxon name
     cex=1.1, # scaling factor of font size
     direction = "rightwards", # tree orientation
     main="strict consensus") # plot label

plot(phy_decay, type = "phylogram",
     no.margin=FALSE, # fill image space
     show.tip.label = TRUE, # include taxon names
     show.node.label = FALSE, # include internal support values
     edge.color = "black", # line color
     edge.width = 1, # line thickness
     use.edge.length = FALSE,
     label.offset=.5, # amount of separation between line and taxon name
     cex=1.1, # scaling factor of font size
     direction = "rightwards",
     main="Strict consensus and Bremer support") # plot label
nodelabels(phy_decay$node.label, adj = c(1.15, 1.3),  cex=1.0, # adds support values, adj= displacement L-R, top-bottom, cex=scaling factor in font size
           frame = "none")

plot(phy_boot, type = "phylogram",
     no.margin=FALSE, # fill image space
     show.tip.label = TRUE, # include taxon names
     show.node.label = FALSE, # include internal support values
     edge.color = "black", # line color
     edge.width = 1, # line thickness
     label.offset=.5, # amount of separation between line and taxon name
     cex=1.1, # scaling factor of font size
     direction = "rightwards",
     main="majority-rule on 500 bootstrap") # plot label
nodelabels(phy_boot$node.label, adj = c(1.15, 1.3),  cex=1.0, # adds support values, adj= displacement L-R, top-bottom, cex=scaling factor in font size
           frame = "none")

plot(phy_adams, type = "phylogram",
     no.margin=FALSE, # fill image space
     show.tip.label = TRUE, # include taxon names
     show.node.label = FALSE, # include internal support values
     edge.color = "black", # line color
     edge.width = 1, # line thickness
     label.offset=.5, # amount of separation between line and taxon name
     cex=1.1, # scaling factor of font size
     direction = "rightwards", # tree orientation
     main="Adams consensus") # plot label

plot(phy_bayesian, type = "phylogram",
     no.margin=FALSE, # fill image space
     show.tip.label = TRUE, # include taxon names
     show.node.label = FALSE, # include internal support values
     edge.color = "black", # line color
     edge.width = 1, # line thickness
     use.edge.length = FALSE,
     label.offset=.5, # amount of separation between line and taxon name
     cex=1.1, # scaling factor of font size
     direction = "rightwards",
     main="Bayesian") # plot label
     # I add the Bayesian support values manually, because I can't get them to load normally, not sure why. 

 dev.off() # terminate making the PDF.



pdf("tom_stuff/runfile_and_output/NUFV137_2022_01_19/analyses_main_ms/plotting_trees/plot_Fig4.pdf", # File name 
     width = 12, height = 8)
 layout(matrix(1:2, 1,2)) # assign number of plots and then organization: rows by columns
 # reduced for main figure
 plot(phy_decay, type = "phylogram",
      no.margin=FALSE, # fill image space
      show.tip.label = TRUE, # include taxon names
      show.node.label = FALSE, # include internal support values
      edge.color = "black", # line color
      edge.width = 1, # line thickness
      use.edge.length = FALSE,
      label.offset=.5, # amount of separation between line and taxon name
      cex=1.1, # scaling factor of font size
      direction = "rightwards",
      main="Strict consensus and Bremer support") # plot label
 
 plot(phy_bayesian, type = "phylogram",
      no.margin=FALSE, # fill image space
      show.tip.label = TRUE, # include taxon names
      show.node.label = FALSE, # include internal support values
      edge.color = "black", # line color
      edge.width = 1, # line thickness
      use.edge.length = FALSE,
      label.offset=.5, # amount of separation between line and taxon name
      cex=1.1, # scaling factor of font size
      direction = "leftwards",
      main="Bayesian") # plot label

  dev.off() # terminate making the PDF.
 
 
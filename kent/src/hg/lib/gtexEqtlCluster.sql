# gtexEqtlCluster.sql was originally generated by the autoSql program, which also 
# generated gtexEqtlCluster.c and gtexEqtlCluster.h.  This creates the database representation of
# an object which can be loaded and saved from RAM in a fairly 
# automatic way.

#BED5+ of eQTLs (variants affecting gene expression) with a target (gene or tissue), and lists of values related to combined factors (e.g. tissues or genes)
CREATE TABLE gtexEqtlCluster (
    bin smallint not null,              # Bin number for browser speedup
    chrom varchar(255) not null,	# Reference sequence chromosome or scaffold
    chromStart int unsigned not null,	# Start position in chromosome
    chromEnd int unsigned not null,	# End position in chromosome
    name varchar(255) not null,	# Name of variant (rsID or GTEx identifier if none)
    score int unsigned not null,	# Score from 0-1000
    targetId varchar(255) not null,	# Identifier of target (gene or tissue)
    target varchar(255) not null,	# Name of target (gene or tissue)
    distance int not null,	# Distance from TSS
    maxEffect float not null,	# Maximum absolute value effect size in cluster
    effectType char(1) not null,	# +, -, 0 (for mixed)
    maxPvalue float not null,	# Maximum -log10 pValue in cluster
    expCount int unsigned not null,	# Number of experiment values
    expNames longblob not null,	# Comma separated list of experiment names (e.g. tissue or gene)
    expScores longblob not null,	# Comma separated list of effect size values
    expPvals longblob not null,	# Comma separated list of -log10 transformed p-values
    expProbs longblob not null,	# Comma separated list of probabilities variant is in high confidence causal set
              #Indices
    INDEX chrom (chrom,bin),
    INDEX target (target),
    INDEX variant (name),
    PRIMARY KEY (targetId,variant)
);
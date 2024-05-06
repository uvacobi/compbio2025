# Computational Biology Course

## Predicting Protein Structure Using Open-Source Tools

### Introduction
This tutorial guides you through the process of using **PyMOL** and **ColabFold** to predict protein structures. PyMOL is used for visualizing the structures, while ColabFold, based on AlphaFold2, allows you to predict the protein structures.

### Relevant links
ColabFold paper - https://www.nature.com/articles/s41592-022-01488-1
ColabFold github - https://github.com/sokrypton/ColabFold?tab=readme-ov-file

### Step 0: Protein sequence clusters 

1. Protein sequences are aligned to protein reference databases, such as UniRef90.

    The Uniprot Reference Cluster database has different numbers of clusters depending on the stringency of sequence clustering.
    
    Selecting for the UniRef50 set, navigate to entry `UniRef50_A0A009H115`.

    **Question 1**: In this protein cluster, how many unique clusters are there for UniRef50, UniRef90, and UniRef100? Explain the reason for the total number of clusters within each reference set.

### Step 1: Using ColabFold on Google Colab
ColabFold allows you to run a less resource heavy version of AlphaFold2 within the Google Colab environment, in an interactive notebook.

1. Instantiate a Colab notebook - https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb
2. Run through the entire notebook (takes ~5 minutes) and then review the outputs.
3. View the output files.
    - e.g., 
        ```
        (base) gloriasheynkman@glorias-mbp test_a5e17 % tree
        .
        ├── cite.bibtex
        ├── config.json
        ├── log.txt
        ├── test_a5e17.a3m
        ├── test_a5e17.csv
        ├── test_a5e17.done.txt
        ├── test_a5e17_coverage.png
        ├── test_a5e17_env
        │   ├── bfd.mgnify30.metaeuk30.smag30.a3m
        │   ├── msa.sh
        │   ├── out.tar.gz
        │   ├── pdb70.m8
        │   └── uniref.a3m
        ├── test_a5e17_pae.png
        ├── test_a5e17_plddt.png
        ├── test_a5e17_predicted_aligned_error_v1.json
        ├── test_a5e17_scores_rank_001_alphafold2_ptm_model_3_seed_000.json
        ├── test_a5e17_scores_rank_002_alphafold2_ptm_model_4_seed_000.json
        ├── test_a5e17_scores_rank_003_alphafold2_ptm_model_2_seed_000.json
        ├── test_a5e17_scores_rank_004_alphafold2_ptm_model_5_seed_000.json
        ├── test_a5e17_scores_rank_005_alphafold2_ptm_model_1_seed_000.json
        ├── test_a5e17_unrelaxed_rank_001_alphafold2_ptm_model_3_seed_000.pdb
        ├── test_a5e17_unrelaxed_rank_002_alphafold2_ptm_model_4_seed_000.pdb
        ├── test_a5e17_unrelaxed_rank_003_alphafold2_ptm_model_2_seed_000.pdb
        ├── test_a5e17_unrelaxed_rank_004_alphafold2_ptm_model_5_seed_000.pdb
        └── test_a5e17_unrelaxed_rank_005_alphafold2_ptm_model_1_seed_000.pdb
        ```




**Question 2**

The options for MSA mode are showng below. Which option should take the most or least amount of compute time? Why?
```
mmseqs2_uniref_env
mmseqs2_uniref
single_sequence
custom
```

**Question 3**:

In the test protein (PIAQIH...), the backbone structures are displayed in two ways. First, by coloring the N-terminus to the C-terminus of the protein. And, second, based on the confidence of structural prediction, quantified by the pLDDT (per-residue Local Distance Difference Test) score. What areas have lower confidence? Why?


### Step 1: Setting Up PyMOL
PyMOL is a tool for the visualization of protein structures. It is available in both free and paid versions. We will use the open-source version.

1. Install PyMol, using any of the options below:
   - Visit the PyMOL open-source project page: [PyMOL GitHub](https://github.com/schrodinger/pymol-open-source/tree/master). Follow the installation instructions specific to your operating system.
   - Use a package installer, such as Homebrew (e.g., `brew install pymol)

2. Open PyMol. A GUI should open up.

**Question 4**:

Open the pdf file for the first model `test_a5e17_unrelaxed_rank_005_alphafold2_ptm_model_1_seed_000.pdb`.
View the protein.
What do you observe in terms of secondary structures?

**Question 5**:

Concurrently open both model #1 and #2. In the PyMol command line, align the two models. Note the overlap.

Now - run CoLab again, but change an amino acid that is located in the alpha helix.
Align and report the degree of overlap.

Next, change an amino acid residue located in the beta-sheet.
Align and report the overlap.






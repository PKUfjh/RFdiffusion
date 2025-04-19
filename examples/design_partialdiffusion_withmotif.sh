#!/bin/bash
# Here, we're generating peptide binders, inspired by the work in Vazquez-Torres et al
# We want to make a binder to a specific peptide sequence, which we know can adopt a roughly helical geometry
# We therefore model the peptide as an ideal helix, docked into a grooved scaffold
# We then noise the whole structure, but provide RFdiffusion with the sequence of the peptide
# RFdiffusion can then predict the structure of the peptide, while designing an improved binder to it (by sampling around the groove scaffold topology)
# In the command, we specify the output path and input pdb.
# We then describe the protein with the contig input. The groove scaffold is 172 amino acids long, so we specify:
#   - 172-172/0 which is 172 residues followed by a chainbreak (between the scaffold and the peptide)
#   - 34-34 The peptide is 34 residues long
# This contig will lead to the whole input pdb being noise by 10 steps (partial_T=10)
# However, we provide the sequence of the peptide (the last 20 residues in the contig), with provide_seq=[172-205]. This is 0-indexed

../scripts/run_inference.py inference.output_prefix=example_outputs/design_partialdiffusion_withmotif inference.input_pdb=input_pdbs/design_binder_case.pdb 'contigmap.contigs=["107-107/0 B108-558"]' diffuser.partial_T=10 inference.num_designs=3

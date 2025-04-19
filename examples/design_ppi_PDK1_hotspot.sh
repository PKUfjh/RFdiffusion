#!/bin/bash
# Here, we're designing binders to insulin receptor, without specifying the topology of the binder a prior
# We first provide the output path and input pdb of the target protein (insulin receptor)
# We then describe the protein we want with the contig input:
#   - residues 1-150 of the A chain of the target protein
#   - a chainbreak (as we don't want the binder fused to the target!)
#   - A 20-30 residue binder to be diffused (the exact length is sampled each iteration of diffusion)
# We tell diffusion to target three specific residues on the target, specifically residues 59, 83 and 91 of the A chain
# We make 3 designs, and reduce the noise added during inference to 0, to improve the quality of the designs

../scripts/run_inference.py inference.output_prefix=example_outputs/PDK1_hotspot inference.input_pdb=input_pdbs/PDK1.pdb 'contigmap.contigs=[A71-232/A237-240/A242-359/0 10-15]' 'ppi.hotspot_res=[A76,A114,A124,A148,A155]' inference.num_designs=3 denoiser.noise_scale_ca=0 denoiser.noise_scale_frame=0

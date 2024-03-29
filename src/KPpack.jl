module KPpack
# ===============================================================================================================================
# libraries
using LinearAlgebra
using CSV
using DataFrames
using DelimitedFiles
using SparseArrays, BlockBandedMatrices
using Arpack
using PyCall, PyPlot, LaTeXStrings
using Printf
using Symbolics

#export Materials, parMat, DOS, DiagM, Plotbands, PlotDOS,

#materials parameters
mutable struct Materials
    material #material or alloy name with composition: alloy_comp
    g1  #Luttinger parameter gamma_1
    g2  #Luttinger parameter gamma_
    g3  #Luttinger parameter gamma_1
    Eg  #material's band gap
    Ep  # Ep parameter
    F   # F parameter
    k     # kappa Luttinger parameter
    delta # spin-orbit valence band split
    VBO   #valence band offset
    me    #effective mass       
    al    #lattice parameter
    B     #B parameter
end

# =================================================================================
# Bowing parameters
mutable struct BowPar
    alloy
    cEg1
    cEg2
    cEp
    cF
    cDelta
    cVBO
    cme
end
# ====================================================================================
# using for the formation of quantum wells
struct mat
    material # name of alloy or material in the same format that structure "Materials"
    size     # size of the layer
end
# ===========================================================================================
#simbolic calculations
include("symb.jl")
#diagonalizes the Hamiltonian matrix and find the DOS
include("solver.jl")
#adquires the material parameters
include("Params.jl")
#Shows the band structure and the DOS
include("plot.jl")
#finite diffrerences kp 8 band hamiltonian matrix
include("FDmat.jl")

end # module

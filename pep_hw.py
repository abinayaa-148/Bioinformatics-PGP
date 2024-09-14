#amino acid counter 

peptide=str(input("Give the peptide that to be analysed:"))
#converting peptide into list
pep_list=peptide.split("-")
pep_list_with_no_duplicates=list(set(pep_list))
print(f"there are{len(pep_list_with_no_duplicates)} number of unique amino acids")

for amino_acid in pep_list_with_no_duplicates:
    print(f"{amino_acid} is present {pep_list.count(amino_acid)}")
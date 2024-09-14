#amino acid counter 
peptide=str(input("Give the peptide that to be analysed:"))
#converting peptide into list
pep_list=peptide.split("-")
print(pep_list)
# Initialize an empty dictionary to store the count of each aa
aa_count = {}
# Iterate through each aa in the list
for aa in pep_list:
    if aa in aa_count:
        aa_count[aa] += 1
    else:
        aa_count[aa] = 1

# Display the count of each aa
for aa, count in aa_count.items():
    print(f"Amino acid '{aa}' repeats {count} times.")

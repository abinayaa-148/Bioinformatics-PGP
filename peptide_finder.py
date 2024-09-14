#amino acid counter 

peptide=str(input("Give the peptide that to be analysed:"))
#converting peptide into list
pep_list=peptide.split("-")

#variable count
count=0
target=str(input("What peptide do you want to find?"))
for i in pep_list:
    if target==i:
        count=count+1
print(f"{target} is present {count} times")
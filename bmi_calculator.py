# defining variables
weight=input("What is your weight (in kgs):")
height=input("What is your height (in meters):")
bmi=int(weight)/(float(height)*float(height))
print(bmi)

#conditions
if bmi<18.5:
    print("You're underweight")
elif bmi>=18.5 and bmi<=24.9:
    print("You're healthy")
elif bmi>=25 and bmi<=29.9:
    print("You're overweight")
else:
    print("You're obese")
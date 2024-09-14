#creating our first password checker program

# creating variables
user_name="Abinayaa"
password="abi@148"

#define inputs
input_user_name=input("Username:")
input_password=input("Password:")

#conditions
if input_user_name==user_name and input_password==password:
    print(f"Welcome, {user_name}")
elif input_user_name!=name and input_password==password:
    print("Invalid Username")
elif input_user_name==name and input_password!=password:
    print("Invalid Password")
else:
    print("Sorry no match found")

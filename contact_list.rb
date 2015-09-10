require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets


def grab_phonenumber
  phonenumbers = []
   puts "do you have a phone number"
  yes_no= STDIN.gets.chomp 
  until yes_no == "no"
    puts "whats your phone number?"
    number = STDIN.gets.chomp
    puts "is it home or mobile?"
    label= STDIN.gets.chomp 
    phonenumber = {label: label, number: number} 
    phonenumbers << phonenumber 
    puts "do you have any more phone numbers?"
    yes_no = STDIN.gets.chomp
  end
  phonenumbers 
end



# Contact.create()

user_input = ARGV[0]

case user_input
  when "help"
    puts "this is the help menu, what would you like to do:
    new- create a new contact
    list- list all contacts 
    show- show a contact
    find- find a contact"



when "new"
  puts "please input your full name"
  name = STDIN.gets.chomp
  puts "please input your email id"
  email= STDIN.gets.chomp
  phonenumber = grab_phonenumber

  new_contact = Contact.create(name,email,phonenumber)
 

  if Contact.duplicate?(new_contact)
    puts 'it was a duplicate'
  else
    puts 'it was a new contact'
     ContactDatabase.save_to_CSV(new_contact)
  end
 # p "contact #{new_contact.id} created"

 # Check if contact already exists
 # If it does, don't save it.
 # Otherwise, save it.
  
when "list"
  p ContactDatabase.read_all 

when "find"
  puts "who are you looking for?"
  term = STDIN.gets.chomp 
  if Contact.find(term).length == 0
    p "not found"
  else 
    p Contact.find(term)
  end

# when "new number"
#   puts "please input whether it is home, or mobile number?"
#   label = STDIN.gets.chomp
#   puts "please input the number"
#   number = STDIN.gets.chomp 

#     new_number = PhoneNumber.new(label,number)
#   end 


end






require_relative 'contact_database'
require 'pry'

class Contact
 
  attr_accessor :name, :email, :id, :phonenumbers 

  def initialize(name, email,id,phonenumbers)
    @name = name
    @email = email
    @id = id 
    @phonenumbers = phonenumbers 
  end
 
  def to_s
    @name + @email
  end
 
  ## Class Methods
  class << self
    @@contacts = ContactDatabase.read_all
    
    def create(name, email,phonenumbers)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      id = @@contacts.length + 1
      Contact.new(name, email,id,phonenumbers)
    end 
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      result = []
      @@contacts.each do |contact|
        if contact.include?(term) 
          result << contact
        end 
      end
      return result 
    end

 
    def all
       @@contacts 
    end
    
    def show(id)
     @@contacts[id -1]
    end

    def duplicate?(contactObject)
      @@contacts.each do |contact|
        # binding.pry
        if contact.include?(contactObject.name) || contact.include?(contactObject.email)
          puts "Contact already exists"
          return true
        end
      end 
      false
    end 
  end
end 

 
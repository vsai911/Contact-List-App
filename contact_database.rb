## TODO: Implement CSV reading/writing
require 'csv'
class ContactDatabase

  def self.save_to_CSV(contact)
    CSV.open('contacts.csv', 'a') do |csv| 
    # contact.array each do |row_array|
    #   contact << row_array 
    # end
      csv << [contact.name, contact.email,contact.phonenumbers] 
    end 
  end

  def self.read_all
    list = []
    CSV.foreach("contacts.csv") do |row|
      list << row
    end
    list 
  end


end







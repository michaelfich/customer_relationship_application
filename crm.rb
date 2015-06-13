require_relative "rolodex"

class CRM

  attr_reader :name

  def self.run(name)
    crm = new(name)
    crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display a contact"
    puts "[6] Display an attribute"
    puts "[7] Exit"
  end

  def call_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3
      puts "Delete a contact."
      delete_contact
      puts "Contacted deleted."
    when 4 then display_contacts
    when 5 then display_contact
    when 6 then display_attribute
    when 7
      puts "Goodbye!"
      exit
    else
      puts "I'm sorry, Dave.  I'm afraid I can't do that."
    end
  end

  def print_contact_menu
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email address"
    puts "[4] Notes"
  end

  def main_menu
    puts "Welcome to #{@name}."

    while true
      print_main_menu

      print "Select an option: "
      input = gets.chomp.to_i

      clear

      call_option(input)

      puts ""
    end
  end

  def add_contact
    puts "Add a new contact!"

    @rolodex.add_contact(get_user_input)
  end

  def edit_contact
    contact = display_contact

    print "Is this the contact that you wish to edit [yes/no]: "
    confirm = gets.chomp.downcase

    if confirm == "yes" || confirm == "y"
      print_contact_menu

      print "Which option did you want to update [1-4]: "
      key = gets.chomp.to_i

      if key == 1
        key = :first_name
        print "Enter the new first name: "
      elsif key == 2
        key = :last_name
        print "Enter the new last name: "
      elsif key == 3
        key = :email
        print "Enter the new email address: "
      elsif key == 4
        key = :notes
        print "Enter the new notes: "
      end

      value = gets.chomp

      @rolodex.modify_contact(contact.id, key, value)
    end
  end

  def delete_contact
    contact = display_contact
    @rolodex.delete_contact(contact.id)
  end

  def display_contacts
    clear
    @rolodex.display_contacts
  end

  def display_contact
    print "Enter the ID of the contact: "
    id = gets.chomp.to_i

    @rolodex.display_contact_by_id(id)
  end

  def display_attribute
    print_contact_menu

      print "Which option would you like to select [1-4]: "
      attribute = gets.chomp.to_i

      case attribute
      when 1
        key = :first_name
        print "Enter first name: "
      when 2
        key = :last_name
        print "Enter last name: "
      when 3
        key = :email
        print "Enter email address: "
      when 4
        key = :notes
        print "Enter notes: "
      end

      value = gets.chomp

      clear

      contacts = @rolodex.display_info_by_attribute(key, value)
  end

  def get_user_input
    user = {}

    print "First name: "
    user[:first_name] = gets.chomp

    print "Last name: "
    user[:last_name] = gets.chomp

    print "Email: "
    user[:email] = gets.chomp

    print "Notes: "
    user[:notes] = gets.chomp

    user
  end

  def clear
    puts "\e[H\e[2J"
  end

end

CRM.run("Bitmaker Labs CRM")

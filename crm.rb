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
    when 1
      add_contact
      puts "Contact added!"
    when 2 then edit_contact
    when 3 then delete_contact
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

  def print_update_menu
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

      return if input == 6

      call_option(input)

      puts ""
    end
  end

  def add_contact
    puts "Add a new contact!"

    @rolodex.add_contact(get_user_input)
  end

  def edit_contact
    print "Enter the ID of the contact to be edited: "
    id = gets.chomp.to_i

    @rolodex.display_contact_by_id(id)

    print "Is this the contact that you wish to edit [yes/no]: "
    confirm = gets.chomp.downcase

    if confirm == "yes" || confirm == "y"
      print_update_menu

      print "Which option did you want to update [1-4]: "
      key = gets.chomp.to_i

      if key == 1
        key = :first_name
        print "Enter the new first name: "
      elsif key == 2
        key = :last_name
        print "Enter the new last name"
      elsif key == 3
        key = :email
        print "Enter the new email address: "
      elsif key == 4
        key = :notes
        print "Enter the new notes:"
      end

      value = gets.chomp

      @rolodex.modify_contact(id, key, value)
    end
  end

  def display_contacts
    @rolodex.display_all_contacts
  end

  def display_contact
    print "Enter the ID of the contat you want to display: "
    id = gets.chomp.to_i

    @rolodex.display_contact_by_id(id)
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

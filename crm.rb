require_relative "rolodex.rb"

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
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display a contact"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contacts
    when 4 then display_attribute
    when 5 then delete_contact
    when 6
      puts "Goodbye!"
      exit
    else
      puts "I'm sorry, Dave.  I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}."

    while true
      print_main_menu

      print "Select an option: "
      input = gets.chomp.to_i

      return if input == 6

      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact."

    print "First name: "
    first = gets.chomp

    print "Last name: "
    last = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first, last, email, notes)
  end

  def edit_contact
    puts "Editing a contact."
  end

end

CRM.run("Bitmaker Labs CRM")

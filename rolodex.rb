require_relative "contact.rb"

class Rolodex

  @@id = 1

  def initialize
    @contacts = []
  end

  def add_contact(first, last, email, note)
    contact = Contact.new(@@id, first, last, email, note)
    @@id += 1

    @contacts << contact
  end

  def modify_contact

  end

  def display_all_contacts

  end

  def display_particular_contact

  end

  def display_info_by_attribute

  end

  def delete_contact

  end

end
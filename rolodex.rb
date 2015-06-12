require_relative "contact"

class Rolodex

  @@last_id = 0

  def initialize
    @contacts = []

    # sample content
    add_contact(first_name: "Michael", last_name: "Fich", email: "michaeltf@gmail.com", notes: "This is me.")
    add_contact(first_name: "Homer", last_name: "Simpson", email: "homer@simpson.com", notes: "The Simpsons")
    add_contact(first_name: "Peter", last_name: "Griffin", email: "peter@griffin.com", notes: "Family Guy")
    add_contact(first_name: "Tony", last_name: "Soprano", email: "tony@soprano.com", notes: "King of New Jersey")
    add_contact(first_name: "Fred", last_name: "Flintstone", email: "yaba@daba.do", notes: "Prehistoric")
  end

  def add_contact(input)
    @@last_id += 1
    contact = Contact.new(@@last_id, input)

    @contacts << contact
  end

  def modify_contact(id, key, value)
    @contacts.each do |contact|
      if contact.id == id
        case key
        when :first_name then contact.first_name = value
        when :last_name then contact.last_name = value
        when :email then contact.email = value
        when :notes then contact.notes = value
        end
      end
    end
  end

  def display_all_contacts
    @contacts.each do |contact|
      contact.display
    end
  end

  def display_contact_by_id(id)
    @contacts.each do |contact|
      if contact.id == id
        contact.display
        return
      end
    end
  end

  def display_info_by_attribute

  end

  def delete_contact(id)
    @contacts.each do |contact|
      if contact.id == id
        @contacts.delete(contact)
      end
    end
  end

end
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
    add_contact(first_name: "Michael", last_name: "Jones", email: "michael@jones.com", notes: "This is not me.")
    add_contact(first_name: "Mike", last_name: "Fich", email: "michaelfich@outlook.com", notes: "This is another me.")
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
        when :first_name then contact.first_name = value.capitalize
        when :last_name then contact.last_name = value.capitalize
        when :email then contact.email = value.downcase
        when :notes then contact.notes = value
        end
      end
    end
  end

  def display_contacts(contacts=nil)
    if contacts
      return contacts.each { |contact| contact.display }
    else
      return @contacts.each { |contact| contact.display }
    end
  end

  def display_contact_by_id(id)
    @contacts.each do |contact|
      if contact.id == id
        contact.display
        return contact
      end
    end
  end

  def display_info_by_attribute(attribute, value)
    contacts = []

    if attribute == :first_name
      contacts = @contacts.select { |contact| contact.first_name == value }
    elsif attribute == :last_name
      contacts = @contacts.select { |contact| contact.last_name == value }
    elsif attribute == :email
      contacts = @contacts.select { |contact| contact.email == value }
    elsif attribute == :notes
      contacts = @contacts.select { |contact| contact.notes == value }
    end

    display_contacts(contacts)
  end

  def delete_contact(id)
    @contacts.delete_if do |contact|
      contact.id == id
    end
  end

end
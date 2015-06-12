class Contact

  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(id, input)
    @id = id
    @first_name = input[:first_name].capitalize
    @last_name = input[:last_name].capitalize
    @email = input[:email].downcase
    @notes = input[:notes]
  end

  def display
    puts "Contact ID: #{@id}"
    puts "First name: #{@first_name}"
    puts "Last name: #{@last_name}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}"
  end
end
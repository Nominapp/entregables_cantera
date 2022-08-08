class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "El archivo #{filename} fue creado por #{@username} a las #{time}."
  end

  def update(filename)
    time = Time.now
    puts "El archivo #{filename} fue actualizado por #{@username} a las #{time}."
    @files[filename] = time + (60 * 60 * 24)
  end

  def delete(filename)
    time = Time.now
    puts "El archivo #{filename} fue eliminado por #{@username} a las #{time}."
    @files = @files.delete(@files[filename])
  end

  def Computer.get_users
    @@users
  end

  def get_files
    @files
  end
end

# Testing

my_machine = Computer.new("eric", 01234)
your_machine = Computer.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Computer.get_users}, files: #{my_machine.get_files}, #{your_machine.get_files}"

my_machine.update("groceries.txt")
your_machine.update("todo.txt")

puts "Users: #{Computer.get_users}, files: #{my_machine.get_files}, #{your_machine.get_files}"

my_machine.delete("groceries.txt")
your_machine.delete("todo.txt")

puts "Users: #{Computer.get_users}, files: #{my_machine.get_files}, #{your_machine.get_files}"

username = ARGV[0]
puts "Привет, #{username}!"

# Попросить пользователя ввести команду Ruby
puts "Введите команду Ruby:"

ruby_command = $stdin.gets.chomp.downcase

# Попросить пользователя ввести команду OC
puts "Введите команду OC:"
os_command = $stdin.gets.chomp.downcase

# Выполнить команду Ruby
puts "Выполняем команду Ruby: #{ruby_command}"
system(ruby_command)

# Выполнить команду OC
puts "Выполняем команду OC: #{os_command}"
system(os_command)

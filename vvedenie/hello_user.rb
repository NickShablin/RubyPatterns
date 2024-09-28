username = ARGV[0]
puts "Привет, #{username}!"

puts "Какой у вас любимый язык программирования?"

favorite_language = $stdin.gets.chomp.downcase

if favorite_language == "ruby"
  puts "Поздравляем, вы подлинный подлиза!"
else
  puts "Не беспокойтесь, скоро будет Ruby!"
end

case favorite_language
  when "python"
    puts "Питон Пуссибой..."
  when "java"
    puts "Ладно, джава норм"
  when "csharp"
    puts "Псих..."
  else
    puts "Почему не ruby...?"
end

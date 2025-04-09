require "rqrcode"
require "active_support/all"

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"


codetype =gets.chomp

if codetype.include? ("1") 
  puts "What is the URL you would like to encode?"
  puts

  text_code = gets.chomp
  puts

 
elsif codetype.include? ("2") 
  puts "What is the name of the wifi network?"
  puts

  network = gets.chomp
  puts

  puts "What is the password?"
  puts

  password = gets.chomp
  puts

  text_code = "WIFI:T:WPA;S:#{network};P:#{password};;"

elsif codetype.include? ("3") 
  puts "What is the phone number you want the code to send a text message to?"
  puts

  phone_number = gets.chomp
  puts

  puts "What do you want to populate the message with?"
  puts

  message_body = gets.chomp
  puts 

  text_code = "SMSTO:#{phone_number}:#{message_body}"

elsif codetype.include? ("4") 
  puts "Goodbye!"

else 
  puts "Didn't recognize that selection. Please try again."
end


puts "What would you like to call the PNG?"
puts

png_name = gets.chomp

qrcode = RQRCode::QRCode.new("#{text_code}")
png = qrcode.as_png({ :size => 500})


IO.binwrite("#{png_name}.png", png.to_s)

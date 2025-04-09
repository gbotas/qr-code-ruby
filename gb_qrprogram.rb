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

if codetype == 1 #or anything similar
  puts "What is the URL you would like to encode?"
  puts
  text = gets.chomp
  puts "What would you like to call the PNG?"
  png_name = gets.chomp
  #provide qr using url. maybe requiring another file?

elsif codetype == 2
  puts "What is the name of the wifi network?"
  network = gets.chomp
  puts "What is the password?"
  password = gets.chomp
  puts "What would you like to call the PNG?"
  png_name = gets.chomp

elsif codetype == 3
  puts "What is the phone number you want the code to send a text message to?"
  phone_number = gets.chomp
  puts "What do you want to populate the message with?"
  message_body = gets.chomp
  puts "What would you like to call the PNG?"
  png_name = gets.chomp

elsif codetype == 4
  puts "Goodbye!"

else 
  puts "Didn't recognize that selection. Please try again."
end


#Use the RQRCode:: QRCode class to encode some text

qrcode = RQRCode::QRCode.new(text.to_s)

#qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:UPC303;P:UPCPark303S;;")

#qrcode = RQRCode::QRCode.new("SMSTO:+countrycode and number: Hola Pepsicola!")

# Use the /as_png method to create a 500 px by 500 px image
png = qrcode.as_png({ :size => 500})

# Write the image data to a file
IO.binwrite(png_name.to_s, png.to_s)

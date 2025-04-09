require "rqrcode"

#Use the RQRCode:: QRCode class to encode some text

#qrcode = RQRCode::QRCode.new("https://www.marca.com/")

#qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:UPC303;P:UPCPark303S;;")

#qrcode = RQRCode::QRCode.new("SMSTO:+countrycode and number: Hola Pepsicola!")

# Use the /as_png method to create a 500 px by 500 px image
png = qrcode.as_png({ :size => 500})

# Write the image data to a file
IO.binwrite("sms.png", png.to_s)

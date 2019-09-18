require 'openssl'
require 'base64'

puts 'What is the name of the private key file?'
private_key_file = gets.chomp

puts 'What is the passphrase?'
passphrase = gets.chomp

puts 'What file do you want to import? Make sure it is a text file with each encrypted string on a new line.'
import_filename = gets.chomp

export_filename = 'export.txt'

private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file), passphrase)

all_lines = []
File.open(import_filename, 'r') do |file|
  file.each_line do |encrypted_string|
    all_lines << encrypted_string
  end
end

File.open(export_filename, 'w') do |file|
  all_lines.each do |encrypted_string|
    # encrypted_string.gsub!(/\\n/, "\n")
    ssn = private_key.private_decrypt(Base64.decode64(encrypted_string))
    file.puts ssn
  end
end
puts "Decrypted content exported to #{export_filename}."

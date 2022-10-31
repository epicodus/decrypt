require 'openssl'
require 'base64'

private_key_file = 'private.pem'
passphrase = ''
import_filename = 'input.txt'
export_filename = 'export.txt'

private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file), passphrase)

all_lines = []
File.open(import_filename, 'r') do |file|
  file.each_line do |line|
    all_lines << line
  end
end

File.open(export_filename, 'w') do |file|
  all_lines.each do |line|
    begin
      ssn = private_key.private_decrypt(Base64.decode64(line))
      file.puts ssn
    rescue
      file.puts line
    end
  end
end

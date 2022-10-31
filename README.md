# decrypt.rb

The program is finicky about the format of the private key file. 
The only blank line should be after `DEK-Info`.
An ending newline is okay.

If you get the error `Neither PUB key nor PRIV key: nested asn1 error`,
make sure your private key is in the same format as `example.pem`.

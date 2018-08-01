Android:
========

    Documentation:

        https://developer.android.com/training/app-links/index.html?hl=es

    1) Generate assetlinks.json
    2) Copy file to server_root/.well-known/assetlinks.json

iOS:
=====

    Documentation:

        * https://blog.branch.io/how-to-setup-universal-links-to-deep-link-on-apple-ios-9
        * https://developer.apple.com/library/ios/documentation/General/Conceptual/AppSearch/UniversalLinks.html

    1) Generate apple-app-site-association.txt
    2) Sign file with:
        
        openssl smime -sign -nodetach -in apple-app-site-association.txt -out apple-app-site-association -outform DER -inkey server.key -signer server.crt
    3) Copy apple-app-site-association to server_root/apple-app-site-association
    4) Serve file with content-type "application/pkcs7-mime":

        Nginx:

            location /apple-app-site-association {
              gzip_static on;
              default_type application/pkcs7-mime;
            }


	Script:

		./sign-app-site-association.sh server.crt server.key apple-app-site-association.txt
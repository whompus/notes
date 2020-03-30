## Analyze Text Using Basic Regular Expressions

### How regex works generally in Linux:

* Generally searching line by line
* Anchor characters - two for basic regular expressions:
  * `^` - used as primarily a starting anchor
    * if you wanted to find the letter 'A' at the beginning of a line, use `^A`
  * `$` - used as an end anchor
    * if you wanted to find the letter 'Z' at the end of the line, use `Z$`
* The character `.` is a special metacharacter, it will match any character (except newline)
* We can match groups of characters with `[]`
  * `^[0-9][A-Z][a-z]`
  * For example, if we want to find everything that starts with a capital 'T' (also the first word of the line), the second letter is lowercase, and it's exactly 3 letters long, and the third letter is a vowel:

  ```bash
  grep '^T[a-z][aeiou] ' filename.txt #the space before the ending indicates a space after the pattern we want to find
  ```

* `[^0-9]` means to match anything that is _not_ 0-9
* Say we want to match a pattern that starts with a 'T', second character can be anything, but the third character is _not_ an 'e':

  ```bash
  grep '^T[a-z][^e]' filename.txt
  ```

* `*` - look for repeating character sets (zero or more times)
## Compare/Manipulate File Content and Use Input-Output Redirection

### Using the `|` (pipe)

We can redirect the output of a command to another with the `|` operator

For example, if we have a `autoparts.txt` file and a `grocerylist.txt` file, we can combine the two and sort the lists by running:

```bash
cat autoparts.txt grocerylist.txt | sort > combined.txt
```

The above command will give us a combined list that is sorted alphabetically. The `>` operator

### More useful commands

Another useful command is format, abbreviated `fmt`:

if we have a file called `format.txt` with the contents:

```
This    is   a     test file      that has       weird spacing  and we    need to   fix it.
```

And we want to get rid of the spaces and format it:

```bash
fmt -u format.txt
```

An additional handy tool is `nl` which stands for "number of lines".
We can use this on our grocery list by:

```bash
nl grocerylist.txt
```

`cut` can remove delimiters so that we can see the contents more clearly.

If we have a file called `delimited.txt` with the contents:

```
This is a;delimited file

we can use[whatever we want
```

we can use cut to display the first part (before the semicolon) specifying `;` as the delimiter:

```bash
cut -d ";" -f1 delimited.txt
```

And our output will look like this:

```
This is a

we can use[whatever we want
```

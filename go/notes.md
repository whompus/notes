## Resources

https://github.com/StephenGrider/GoCasts

#### Diagrams

The diagrams shown in the course are attached to this lecture note as a zip file.

https://github.com/StephenGrider/GoCasts/tree/master/diagrams

Open the folder containing the set of diagrams you want to edit

Click on the ‘.xml’ file

Click the ‘raw’ button

Copy the URL

Go to https://www.draw.io/

On the ‘Save Diagrams To…’ window click ‘Decide later’ at the bottom

Click ‘File’ -> ‘Import From’ -> ‘URL’

Paste the link to the XML file

Tada!


## 5 Basic Questions

Given the below code:

```go
package main 

import "fmt"

func main() {
	fmt.Println("Hi there!")
}
```

1. How do we run code in our project? 

`go run main.go`

Other operations:
`go build` - compiles a bunch of go source code files, does not execute, then run `./<filename>` to run binary
`go run` - compiles and executes one or two files
`go fmt` - Formats all the code in each file in the current directory
`go install` - compiles and "installs" a package
`go get` - Downloads the raw source code of someone else's package
`go test` - Runs any tests associated with the current project

2. How does `package main` mean?

Package == Project == Workspace

Package is a collection of common source code files.

Very first line of each file must declare what package it belongs to.

If there are a couple other files in this project that are associated with main, they would also need to have package main at the top.

Types of packages:
Executable - Generates a file that we can run
Reusable - Code used as 'helpers'. Good place to put reusable logic

3. What does `import fmt` mean?

Importing packages. Can see all standard libary packages by going to https://golang.org/pkg

4. What's that `func` thing?

Function declaration.

5. How is the main.go file organized?

Basically the same as in the above code snippet. 

Package -> then Imports -> then Code

## Variables

Go is a strictly typed language. Meaning you have to declare the type when instatiating a variable.

One way of defining: `var card string = "Ace of Spades"`
Another way of defining: `card := "Ace of Spades"` <- this is for initialization only. You can subsequently use `card = "Five of Diamonds` after it's already declared. 

A little more advanced with variable decplaration:

```go
package main
 
import "fmt"
 
var deckSize int
 
func main() {
  deckSize = 50
  fmt.Println(deckSize)
}

// Should print 50. Initialized empty var outside function
```

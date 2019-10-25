package main

import "fmt"

// Integers
var i = 1
var ui uint = 0x8
var i8 = 127
var i16 = 32767
var i32 int32 = 2147483647
var i64 int64 = 9223372036854775807

// Floats
var f32 float32 = 3.1
var f64 = 3.234e123

// Complex
var c64 complex64 = complex(1, 2)
var c128 = complex(-1, 3)

// Others
var b byte = 'a'
var r = '☺'

// Strings
var s1 = "string \"quote\""
var s2 = `raw
"multiline"
string`

// Map
var m = map[string]int{
	"1": 1,
	"2": 2,
}

type x struct {
	number int
	text   string
}

// List
var l = []int{1, 2, 3}

func main() {
	/* multiline
	   comment */
	var x1 *x
	x1 = new(x)
	x1.Hello(42, 3)
}

func operators() {
	fmt.Println(i + 1 - 2*3/4 ^ 5%6)
	fmt.Println(i < 1 && i > 2 || i >= 1 || i <= 3 || i == 4 || !(i != 5) && true || !false)
}

// Hello method
func (x *x) Hello(n int, times int) {
	for i := 0; i < times; i++ {
		fmt.Printf("Hello, %d\n", n+i)
	}
}

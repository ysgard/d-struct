#!/usr/bin/dmd -run
/* sh style script syntax is supported! */
/* Hello World in D
   To compile:
     dmd hello.d
   or to optimize:
     dmd -O -inline -release hello.d
   or to get generated documentation:
     dmd hello.d -D
  */
import this;
some_label: This isa  label
import( a=b );
# line This is a line!
a, b
pragma( b, 1+2 );
auto x = [
  "french vanilla" : 8.75,
  "java": 7.99,
  "french roast": 7.49
];
version( Demo ) {
  do_stuff...
}
static assert ()
static if ()
mixin("
    int x = 3;
    for (int i = 0; i < 3; i++)
      writeln(x + i, ++j);
    ");    // ok

double[] keys = somefunc.some;
assert ( q => function(a, b)  )
assert(keys == [ -1.5, 0.5, -0.5 ]);
meh[1 .. 3]
args = args[1 .. $ 4 ];
alias T elementtype;
template Select(T1, T, U)(bool, cond, T1, T2) {
  static if(cond) {
    alias T1 Type;
  } else {
    alias T2 Type;
  }
}
__traits( isAbstractClass )
isAbstractClass()
try {
    try {
      throw new Exception("first");
    }
    finally {
      writeln("finally");
      throw new Exception("second");
    }
  }
  catch(Exception e) {
    writeln("catch %s", e.msg);
  }
  writeln("done");

__FILE__
struct {

a = b ? c : d;
q = new ba;
delete ba;
a => function
}
double**
double**[string*, bool*] , arg[fun]
asm {
  naked 3 + 43 __LOCAL_SIZE RAX XMM2 hello , no EAX near ptr // this is a comment
  3 * 5
};
deprecated char[]
import string
int
assert ( x = 3 );
char
deprecated char
module something;
version ( hello );
is(string a, x == x, something);
version=3;
version = (a < b) ? true : false;
debug (something); is(djkfjdk)
debug;
mixin(This is a mixin, a = b string whatever, 3.234 "hello" )
__traits( isVirtualMethod, a=a+b, a=3.42 );
this = r"This is a \'quoted\' \t\t string  \?  hello \0 \b \\ this  ";
that = `Alternate \\ wysiwyg string`c;
those = "This is a \xAF \uAFaf \U0009abab double-\amp;quot\heartsed\tstring\34"c;
hstring = x"af d3 3b"c;
dstring = q"<Hello thereH>";
wstring = q{ token this_is_a_var "a string" 3 2.35 throw }
0 0 1 23 434_4343 00; 0Lu 343Lu 0b01111Lu
0x00 0x0f 0xf 0x_ 0XDD 0xffFF_fddf;
0b_ 0b01011010100111;
a+c, b+e, d / d, "should, not, be " ' '
'c'
'\amp'
is( class this, class that, int, whatever, )
q{This is a _______NOT token const x="This was a triumph"; lit=string!};
123_456.567_8
1_2_3_4_5_6_._5_6_7_8
1_2_3_4_5_6_._5e-6
-0x1.FFFFFFFFFFFp1023
0x1p-52
1.175494351e-38F
6.3i
6.3fi
6.3Li
__VERSION__
0
0.234
0.0
3.
.5
.5f
.5f
if (x == 3) {
  This is a block
} else {
  more stuff
}
auto
hello.this.is a . big stuff, followed by another is()
extern (C);
final int x(5);
this = hello ? whatever : dkjfkd;
wstring char[]
auto twice  = function (int x) => x * 2;
auto square = delegate (int x) => x * x;

asm {
  mov EAX,x; // load x and put it in register EAX
}
alias this that;
auto n = 5;
auto mul_n = (int x) => x * n;

writeln(twice(i));   // prints 6
writeln(square(i));  // prints 9
writeln(mul_n(i));   // prints 15
import std.stdio, std.string;  // References to  commonly used I/O routines.
void main(char[][] args)   // 'void' here means return 0 by default.
{
    // Write-Formatted-Line
     writefln("Hello World, "   // automatic concatenation of string literals
              "Reloaded");
     // Strings are denoted as a dynamic array of chars 'char[]'
     // auto type inference and built-in foreach
     foreach(argc, argv; args)

        // OOP is supported, of course! And automatic type inference.
         auto cl = new CmdLin(argc, argv);

        // 'writefln' is the improved 'printf' !!
         // user-defined class properties.
         writefln(cl.argnum, cl.suffix, " arg: %s", cl.argv);
        // Garbage Collection or explicit memory management - your choice!!!
         delete cl;
    }
     // Nested structs, classes and functions!
     struct specs
    {
        // all vars. automatically initialized
         int count, allocated;
    }
    ()
    // Note that declarations read right-to-left.
    // So that 'char[][]' reads as an array of an array of chars.

    specs argspecs(char[][] args)
    // Optional (built-in) function contracts.
     in{
        assert (args.length > 0); // assert built in
     }
    out(result){
        assert(result.count == CmdLin.total);
        assert(result.allocated > 0);
    }
    body{
        specs* s = new specs;
        // no need for '->'
         s.count = args.length;  // The 'length' property is number of elements.
         s.allocated = typeof(args).sizeof; // built-in properties for native types
         foreach(argv; args)
            s.allocated += argv.length * typeof(argv[0]).sizeof;
        return *s;
    }

    // built-in string and common string operations, e.g. '~' is concatenate.
     char[] argcmsg  = "argc = %d";
    char[] allocmsg = "allocated = %d";
    writefln(argcmsg ~ ", " ~ allocmsg,
         argspecs(args).count,argspecs(args).allocated);
}
/**
   Stores a single command line argument.
 */
class CmdLin
{
    private {
     int _argc;
     char[] _argv;
     static uint _totalc;
    }

 public:
/************
      Object constructor.
      params:
        argc = ordinal count of this argument.
        argv = text of the parameter
      *********/
     this(int argc, char[] argv)
    {
        _argc = argc + 1;
        _argv = argv;
        _totalc++;
    }
@safe
    ~this() /// Object destructor
     {
        // Doesn't actually do anything for this example.
     }

     int argnum() /// A property that returns arg number
     {
        return _argc;
    }
     char[] argv() /// A property  that returns arg text
     {
        return _argv;
    }
     wchar[] suffix() /// A property  that returns ordinal suffix
     {
        wchar[] suffix;  // Built in  Unicode strings (utf8,utf16, utf32)
         switch(_argc)
        {
        case 1:
            suffix = "st";
            break;
        case 2:
            suffix = "nd";
            break;
        case 3:
            suffix = "rd";
            break;
        default:  // 'default' is mandatory with "-w" compile switch.
             suffix = "th";
        }
        return suffix;
    }
switch (x)
{
  case 3:
    goto case;
  case 4:
    goto default;
  case 5:
    goto case 4;
  default:
    x = 4;
    break;
}
foreach (int i, char c; a) {
  writefln("a[%d] = '%c'", i, c);
}
with( a == b) {
  printf("something!");
}
synchronized (dkfjkdjf)

int number;
string message;
switch (number)
{
  default:    // valid: ends with 'throw'
    throw new Exception("unknown number");

  case 3:     // valid: ends with 'break' (break out of the 'switch' only)
    message ~= "three ";
    break;

  case 4:     // valid: ends with 'continue' (continue the enclosing loop)
    message ~= "four ";
    continue;

  case 5:     // valid: ends with 'goto' (explicit fall-through to next case.)
    message ~= "five ";
    goto case;

  case 6:     // ERROR: implicit fall-through
    message ~= "six ";

  case 1:     // valid: the body is empty
  case 2:     // valid: this is the last case in the switch statement.
    message = "one or two";
}
/* **************
      * A property of the whole class, not just an instance.
      * returns: The total number of commandline args added.
      *************/
     static typeof(_totalc) total()
    {
        return _totalc;
    }
     // Class invariant, things that must be true after any method is run.
     invariant
     {
         assert(_argc > 0);
         assert(_totalc >= _argc);
     }
}
κόσμε

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
import this,
import( a=b );
# line This is a line!
pragma ( hello, an expression );
__FILE__
asm {
  naked 3 + 43 __LOCAL_SIZE RAX XMM2 hello , no EAX near ptr
};
deprecated char[]
import string
int
char
deprecated char
module something;
version ( hello );
version=3;
debug (something);
debug;
mixin(This is a mixin, a = b string whatever, 3.234 "hello" )
__traits( isVirtualMethod, a=a+b, a=3.42 );
this = r"This is a \'quoted\' \t\t string  \?  hello \0 \b \\ this  ";
that = `Alternate \\ wysiwyg string`c;
those = "This is a \xAF \uAFaf \U0009abab double-\amp;quot\heartsed\tstring\34"c;
hstring = x"af d3 3b"c;
dstring = q"<Hello thereH>";
tstring = q{ token this_is_a_var "a string" 3 2.35 throw }
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
hello.this.is a . big stuff, followed by another is()
extern (D);
final int x(5);
this = hello ? whatever : dkjfkd;
wstring char[]
import std.stdio, std.string;  // References to  commonly used I/O routines.
void main(char[][] args)   // 'void' here means return 0 by default.
{
    // Write-Formatted-Line
     writefln("Hello World, "   // automatic concatenation of string literals
              "Reloaded");
     // Strings are denoted as a dynamic array of chars 'char[]'
     // auto type inference and built-in foreach
     foreach(argc, argv; args)
    {
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

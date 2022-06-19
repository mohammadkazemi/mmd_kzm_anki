# Dart
##  A basic Dart program
```dart
// Define a function.
void printInteger(int aNumber) {
  print('The number is {{c1:$}}aNumber.'); // Print to console.
}

// This is where the app starts executing.
void main() {
  {{c1:var}} number = 42; // Declare and initialize a variable.
  {{c1:printInteger}}(number); // Call a function.
}
```
## String interpolation: including a variable or expression’s string equivalent inside of a string literal. For more information, see Strings.
```dart
{{c1:$variableName}} (or {{c1:${expression}}})

```
##  Important concepts
```text
Although Dart is {{c1:strongly}} typed, {{c1:type annotations}} are {{c1:optional}} because Dart can infer types.
var number = 42;
number is inferred to be of type int.

If you enable {{c1:null safety}}, variables can’t contain null unless you say they can. You can make a variable nullable by putting a {{c1:question mark (?)}} at the end of its type. For example, a variable of type {{c1:int?}} might be an integer, or it might be null. If you know that an expression never evaluates to null but Dart disagrees, you can add {{c1:!}} to assert that it isn’t null (and to throw an exception if it is). An example: int x = {{c1:nullableButNotNullInt!}}

When you want to explicitly say that any type is allowed, use the type {{c1:Object?}} (if you’ve enabled null safety), Object, or—if you must defer type checking until runtime—the special type {{c1:dynamic}}.

Dart supports {{c1:generic}} types, like List<{{c1:int}}> (a list of integers) or List<{{c1:Object}}> (a list of objects of any type).

Dart supports {{c1:top-level}} functions (such as main()), as well as functions tied to a class or object ({{c1:static}} and {{c1:instance methods}}, respectively). You can also create {{c1:functions}} within functions ({{c1:nested or local}} functions).

Similarly, Dart supports {{c1:top-level}} variables, as well as variables tied to a class or object ({{c1:static}} and {{c1:instance variables}}). {{c1:Instance variables}} are sometimes known as {{c1:fields}} or properties.

Unlike Java, Dart doesn’t have the keywords {{c1:public}}, {{c1:protected}}, and {{c1:private}}. If an identifier starts with an {{c1:underscore (_)}}, it’s private to its library. 

Identifiers can start with a {{c1:letter}} or {{c1:underscore (_)}}, followed by any combination of those characters plus {{c1:digits}}.

Dart has {{c1:both expressions}} (which have runtime values) and statements (which don’t). For example, the conditional expression {{c1:condition ? expr1 : expr2}} has a value of expr1 or expr2. Compare that to an if-else statement, which has no value. A statement often contains one or more {{c1:expressions}}, but an expression can’t directly contain a statement.

Dart tools can report two kinds of problems: {{c1:warnings}} and {{c1:errors}}. Warnings are just indications that your code might not work, but they don’t prevent your program from executing. Errors can be either compile-time or run-time. A compile-time error prevents the code from executing at all; a run-time error results in an exception being raised while the code executes.
```

##  Keywords
```dart
<!--
abstract 
else
import 
show 
as 
enum
in
static
assert
export
interface
super
async
extends
is	
switch
await
extension 
late
sync 
break
external 
library
this
case
factory 
mixin
throw
catch
false
new
true
class
final	null
try
const
finally
on
typedef 
continue
for
operator
var
covariant
Function
part
void
default
get
required
while
deferred
hide
rethrow
with
do
if
return
yield 
dynamic
implements
set  -->
```

##  Variables
```dart
{{c1:Variables}} store references. The {{c1:variable}} called name contains a reference to a String object with a value of “Bob”.
{{c1:var}} name = 'Bob';



The type of the name variable is inferred to be String, but you can change that type by specifying it. If an {{c1:object}} isn’t restricted to a single type, specify the Object type (or dynamic if necessary).

{{c1:Object}} name = 'Bob';


Another option is to explicitly declare the type that would be inferred:

{{c1:String}} name = 'Bob';
```

##  Default value
```dart
{{c1:Uninitialized}} variables that have a nullable type have an initial value of null. (If you haven’t opted into null safety, then every variable has a nullable type.) 

int{{c1:?}} lineCount;
assert(lineCount == null);
```

## assert
```dart
 Note: Production code {{c1:ignores}} the assert() call. During development, on the other hand, assert({{c1:condition}}) throws an {{c1:exception}} if condition is false
```


##  Late variables
```dart
Dart 2.12 added the late modifier, which has two use cases:

Declaring a {{c1:non-nullable}} variable that’s initialized after its declaration.
{{c1:Lazily initializing}} a variable.


Often Dart’s control flow analysis can detect when a non-nullable variable is set to a {{c1:non-null}} value before it’s used, but sometimes analysis fails. Two common cases are {{c1:top-level}} variables and {{c1:instance}} variables: Dart often can’t determine whether they’re set, so it doesn’t try.

If you’re sure that a variable is set before it’s used, but Dart disagrees, you can fix the error by marking the variable as {{c1:late}}:

late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}


If you fail to initialize a late variable, a {{c1:runtime}} error occurs when the variable is {{c1:used}}.


When you mark a variable as {{c1:late}} but initialize it at its declaration, then the initializer runs the first time the variable is used. This lazy initialization is handy in a couple of cases:

The variable might not be {{c1:needed}}, and initializing it is {{c1:costly}}.
You’re initializing an {{c1:instance}} variable, and its initializer needs access to this.


In the following example, if the temperature variable is never used, then the expensive _readThermometer() function is never called:

// This is the program's only call to readThermometer().
{{c1:late}} String temperature = readThermometer(); // Lazily initialized.

```

##  Final and const
```dart
If you never intend to change a variable, use {{c1:final}} or {{c1:const}}, either instead of var or in addition to a {{c1:type}}. A {{c1:final}} variable can be set only once; a const variable is a {{c1:compile-time}} constant. ({{c1:Const}} variables are {{c1:implicitly}} final.)

 Note: {{c1:Instance}} variables can be final but not const.

Here’s an example of creating and setting a final variable:

{{c1:final}} name = 'Bob'; // Without a type annotation
{{c1:final}} String nickname = 'Bobby';
You can’t change the value of a {{c1:final}} variable:

name = 'Alice'; // Error: a final variable can only be set once.
Use {{c1:const}} for variables that you want to be compile-time constants. If the const variable is at the {{c1:class}} level, mark it {{c1:static}} const. Where you declare the variable, set the value to a compile-time constant such as a number or string literal, a const variable, or the result of an {{c1:arithmetic}} operation on constant numbers:

const bar = 1000000; // Unit of pressure (dynes/cm2)
{{c1:const double}} atm = 1.01325 * bar; // Standard atmosphere
The const keyword isn’t just for declaring constant variables. You can also use it to create {{c1:constant values}}, as well as to declare {{c1:constructors}} that create constant values. Any variable can have a constant value.

var foo = {{c1:const}} [];
final bar = {{c1:const}} [];
{{c1:const}} baz = []; // Equivalent to `const []`
You can omit const from the initializing expression of a const declaration, like for baz above. For details, see DON’T use const redundantly.

You can change the value of a {{c1:non-final}}, {{c1:non-const}} variable, even if it used to have a const value:

foo = [1, 2, 3]; // Was const []
You can’t change the value of a {{c1:const}} variable:

baz = [42]; // Error: Constant variables can't be assigned a value.
You can define constants that use {{c1:type checks}} and {{c1:casts}} (is and as), {{c1:collection}} if, and {{c1:spread}} operators (... and ...?):

{{c1:const Object}} i = 3; // Where i is a const Object with an int value...
const list = [i {{c1:as int}}]; // Use a typecast.
const {{c1:map}} = {{{c1:if}} (i {{c1:is}} int) i: 'int'}; // Use is and collection if.
const {{c1:set}} = {{{c1:if}} (list {{c1:is}} List<int>) ...list}; // ...and a spread.
Note: Although a final object cannot be modified, its {{c1:fields}} can be changed. In comparison, a {{c1:const object}} and its fields cannot be changed: they’re {{c1:immutable}}.

For more information on using const to create constant values, see Lists, Maps, and Classes.
```

##  Built-in types
```dart
Numbers ({{c1:int}}, {{c1:double}})
Strings ({{c1:String}})
Booleans ({{c1:bool}})
Lists ({{c1:List}}, also known as arrays)
Sets ({{c1:Set}})
Maps ({{c1:Map}})
Runes ({{c1:Runes}}; often replaced by the characters API)
Symbols ({{c1:Symbol}})
The value null ({{c1:Null}})
This support includes the ability to create objects using literals. For example, 'this is a string' is a {{c1:string}} literal, and true is a {{c1:boolean}} literal.

Because every variable in Dart refers to an {{c1:object}}—an {{c1:instance}} of a class—you can usually use {{c1:constructors}} to initialize variables. Some of the built-in types have their own {{c1:constructors}}. For example, you can use the {{c1:Map()}} constructor to create a map.

Some other types also have special roles in the Dart language:

{{c1:Object}}: The superclass of all Dart classes except Null.
{{c1:Enum}}: The superclass of all enums.
{{c1:Future}} and {{c1:Stream}}: Used in asynchrony support.
{{c1:Iterable}}: Used in for-in loops and in synchronous generator functions.
{{c1:Never}}: Indicates that an expression can never successfully finish evaluating. Most often used for functions that always throw an exception.
{{c1:dynamic}}: Indicates that you want to disable static checking. Usually you should use Object or Object? instead.
{{c1:void}}: Indicates that a value is never used. Often used as a return type.
The {{c1:Object}}, {{c1:Object}}?, {{c1:Null}}, and {{c1:Never}} classes have special roles in the class hierarchy, as described in the top-and-bottom section of Understanding null safety.
```


##  Numbers
```dart
Dart numbers come in two flavors:

int
Integer values no larger than {{c1:64}} bits, depending on the {{c1:platform}}. On {{c1:native}} platforms, values can be from -263 to 263 - 1. On the web, integer values are represented as {{c1:JavaScript}} numbers (64-bit floating-point values with no fractional part) and can be from -253 to 253 - 1.

double
{{c1:64}}-bit (double-precision) {{c1:floating-point}} numbers, as specified by the {{c1:IEEE}} 754 standard.

Both int and double are subtypes of {{c1:num}}. The {{c1:num}} type includes basic operators such as +, -, /, and *, and is also where you’ll find {{c1:abs}}(), {{c1:ceil}}(), and {{c1:floor}}(), among other methods. (Bitwise operators, such as >>, are defined in the int {{c1:class}}.) If {{c1:num}} and its subtypes don’t have what you’re looking for, the {{c1:dart:math}} library might.

Integers are numbers without a decimal point. Here are some examples of defining integer literals:

var x = 1;
var hex = {{c1:0x}}DEADBEEF;
var exponent = 8{{c1:e}}5;
If a number includes a decimal, it is a double. Here are some examples of defining double literals:

var y = 1.1;
var exponents = 1.42{{c1:e}}5;
You can also declare a variable as a {{c1:num}}. If you do this, the variable can have both integer and double values.

{{c1:num}} x = 1; // x can have both int and double values
x += 2.5;
Integer literals are automatically converted to doubles when necessary:

double z = 1; // Equivalent to double z = 1.0.
Here’s how you turn a string into a number, or vice versa:

// String -> int
var one = {{c1:int.parse}}('1');
assert(one == 1);

// String -> double
var onePointOne = {{c1:double.parse}}('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.{{c1:toString}}();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.{{c1:toStringAsFixed(2)}};
assert(piAsString == '3.14');
The {{c1:int}} type specifies the traditional bitwise shift ({{c1:<<}}, {{c1:>>}}, {{c1:>>>}}), complement ({{c1:~}}), AND (&), OR (|), and XOR ({{c1:^}}) operators, which are useful for manipulating and masking flags in bit fields. For example:

assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 | 4) == 7); // 0011 | 0100 == 0111
assert((3 & 4) == 0); // 0011 & 0100 == 0000
For more examples, see the bitwise and shift operator section.

Literal numbers are {{c1:compile-time}} constants. Many arithmetic expressions are also {{c1:compile-time}} constants, as long as their operands are {{c1:compile-time}} constants that evaluate to numbers.

const msPerSecond = 1000;
const secondsUntilRetry = 5;
const msUntilRetry = secondsUntilRetry * msPerSecond;
For more information, see Numbers in Dart.
```

##  Strings
```dart
A Dart string (String object) holds a sequence of {{c1:UTF-16}} code units. You can use either {{c1:single}} or {{c1:double}} quotes to create a string:

var s1 = 'Single quotes work well for string literals.';
var s2 = "Double quotes work just as well.";
var s3 = 'It{{c1:\}}'s easy to escape the string {{c1:delimiter}}.';
var s4 = "It's even easier to use the other delimiter.";
You can put the value of an expression inside a string by using {{c1:${expression}}}. If the expression is an identifier, you can skip the {{c1:{}}}. To get the string corresponding to an object, Dart calls the object’s {{c1:toString()}} method.

var s = 'string interpolation';

assert('Dart has {{c1:$s}}, which is very handy.' ==
    'Dart has string interpolation{{c1:, ''}}which is very handy.');
assert('That deserves all caps. '
        '{{c1:${s.toUpperCase()}}} is very handy!' ==
    'That deserves all caps. '
        'STRING INTERPOLATION is very handy!');
 Note: The {{c1:==}} operator tests whether two objects are equivalent. Two strings are equivalent if they contain the same sequence of code units.

You can concatenate strings using {{c1:adjacent}} string literals or the {{c1:+}} operator:

var s1 = 'String '
    'concatenation'
    {{c1:"}} works even over {{c1:line breaks}}.";
assert(s1 ==
    'String concatenation works even over '
        '{{c1:line breaks}}.');

var s2 = 'The {{c1:+}} operator ' {{c1:+}} 'works, as well.';
assert(s2 == 'The {{c1:+}} operator works, as well.');
Another way to create a {{c1:multi-line}} string: use a triple quote with either {{c1:single}} or {{c1:double}} quotation marks:

var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";
You can create a “{{c1:raw}}” string by prefixing it with r:

var s = r'In a raw string, not even \n gets special treatment.';
See Runes and grapheme clusters for details on how to express Unicode characters in a string.

Literal strings are compile-time constants, as long as any interpolated expression is a compile-time constant that evaluates to null or a numeric, string, or boolean value.

// These work in a const string.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// These do NOT work in a const string.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '{{c1:$aConstNum}} {{c1:$aConstBool}} {{c1:$aConstString}}';

// const invalidConstString = '{{c1:$aNum}} {{c1:$aBool}} {{c1:$aString}} {{c1:$aConstList}}';
For more information on using strings, see Strings and regular expressions.
```

##  Booleans
```dart
To represent boolean values, Dart has a type named bool. Only two objects have type bool: the boolean literals true and false, which are both compile-time constants.

Dart’s type safety means that you can’t use code like if (nonbooleanValue) or assert (nonbooleanValue). Instead, explicitly check for values, like this:

// Check for an empty string.
var fullName = '';
{{c1:assert(fullName.isEmpty);}}

// Check for zero.
var hitPoints = 0;
{{c1:assert(hitPoints <= 0);}}

// Check for null.
var unicorn;
{{c1:assert(unicorn == null);}}

// Check for NaN.
var iMeantToDoThis = 0 / 0;
{{c1:assert(iMeantToDoThis.isNaN);}}
```

##  Lists
```dart
Perhaps the most common collection in nearly every programming language is the array, or {{c1:ordered}} group of objects. In Dart, arrays are List objects, so most people just call them lists.

Dart list literals are denoted by a {{c1:comma}} separated list of {{c1:expressions}} or values, enclosed in {{c1:square brackets}} ({{c1:[]}}). Here’s a simple Dart list:

var list = [1, 2, 3];
 Note: Dart {{c1:infers}} that list has type List<int>. If you try to add non-integer objects to this list, the analyzer or runtime {{c1:raises an error}}. For more information, read about type inference.

You can add a {{c1:comma}} after the last item in a Dart collection literal. This trailing {{c1:comma}} doesn’t affect the collection, but it can help prevent {{c1:copy-paste}} errors.

var list = [
  'Car',
  'Boat',
  'Plane',
];

Lists use {{c1:zero-based}} indexing, where 0 is the index of the first value and {{c1:list.length - 1}} is the index of the last value. You can get a list’s length using the {{c1:.length}} property and access a list’s values using the {{c1:subscript}} operator ([]):

var list = [1, 2, 3];
assert(list.{{c1:length}} == 3);
assert(list[{{c1:1}}] == 2);

list[1] = 1;
assert(list[1] == {{c1:1}});
To create a list that’s a {{c1:compile-time}} constant, add const before the list literal:

var constantList = const [1, 2, 3];
// constantList[1] = 1; // This line will cause an error.
Dart 2.3 introduced the spread operator {{c1:(...)}} and the null-aware spread operator {{c1:(...?)}}, which provide a concise way to insert multiple values into a collection.

For example, you can use the spread operator {{c1:(...)}} to insert all the values of a list into another list:

var list = [1, 2, 3];
var list2 = [0, {{c1:...list}}];
assert(list2.length == 4);
If the expression to the right of the spread operator might be null, you can avoid exceptions by using a {{c1:null-aware}} spread operator {{c1:(...?)}}:

var list2 = [0, {{c1:...?list}}];
assert(list2.length == 1);
For more details and examples of using the spread operator, see the spread operator proposal.

Dart also offers collection {{c1:if}} and collection {{c1:for}}, which you can use to build collections using conditionals ({{c1:if}}) and repetition ({{c1:for}}).

Here’s an example of using collection if to create a list with three or four items in it:

// if promoActive is true add 'Outlet'
var nav = ['Home', 'Furniture', 'Plants', {{c1:if (promoActive)}} 'Outlet'];
Here’s an example of using collection for to manipulate the items of a list before adding them to another list:


// adding '#' to listOfInts items and add them to listOfStrings
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', {{c1:for (var i in listOfInts)}} '#$i'];
assert(listOfStrings[1] == '#1');
For more details and examples of using collection if and for, see the control flow collections proposal.

The List type has many handy methods for manipulating lists. For more information about lists, see Generics and Collections.
```

##  Sets
```dart
A set in Dart is an {{c1:unordered}} collection of {{c1:unique}} items. Dart support for sets is provided by set {{c1:literals}} and the Set {{c1:type}}.

Here is a simple Dart set, created using a set literal:

var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
Note: Dart infers that halogens has the type {{c1:Set<String>}}. If you try to add the wrong type of value to the set, the analyzer or runtime {{c1:raises an error}}. For more information, read about type inference.

To create an empty set, use {{c1:{}}} preceded by a {{c1:type}} argument, or assign {{c1:{}}} to a variable of type Set:

var names = <String>{{c1:{}}};
// Set<String> names = {{c1:{}}}; // This works, too.
// var names = {{c1:{}}}; // Creates a map, not a set.
 Set or map? The syntax for map literals is similar to that for set literals. Because map literals came first, {{c1:{}}} defaults to the Map type. If you forget the {{c1:type}} annotation on {{c1:{}}} or the variable it’s assigned to, then Dart creates an object of type {{c1:Map<dynamic, dynamic>}}.

Add items to an existing set using the {{c1:add()}} or {{c1:addAll()}} methods:
Note: Dart infers that halogens has the type {{c1:Set<String>}}. If you try to add the wrong type of value to the set, the analyzer or runtime {{c1:raises an error}}. For more information, read about type inference.

// var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
var elements = <String>{};
elements.{{c1:add}}('fluorine');
elements.{{c1:addAll}}(halogens);
Use {{c1:.length}} to get the number of items in the set:

var elements = <String>{};
elements.{{c1:add}}('fluorine');
elements.{{c1:addAll}}(halogens);
assert(elements{{c1:.length}} == 5);
To create a set that’s a {{c1:compile-time}} constant, add {{c1:const}} before the set literal:

final constantSet = {{c1:const}} {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // This line will cause an error.
Sets support spread operators ({{c1:...}} and {{c1:...?}}) and collection {{c1:if}} and {{c1:for}}, just like lists do. For more information, see the list spread operator and list collection operator discussions.

For more information about sets, see Generics and Sets.
```

##  Maps
```dart
In general, a map is an {{c1:object}} that associates keys and values. Both keys and values can be any {{c1:type}} of object. Each key occurs only {{c1:once}}, but you can use the same value multiple times. Dart support for maps is provided by map {{c1:literals}} and the Map {{c1:type}}.

Here are a couple of simple Dart maps, created using map literals:
// create gifts map 
var gifts = {{c1:{}}
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
{{c1:}}};

var nobleGases = {{c1:{}}
  2: 'helium',
  10: 'neon',
  18: 'argon',
{{c1:}}};
}

Note: Dart infers that gifts has the type Map<{{c1:String}}, {{c1:String}}> and nobleGases has the type Map<{{c1:int}}, {{c1:String}}>. If you try to add the wrong type of value to either map, the analyzer or runtime {{c1:raises an error}}. For more information, read about type inference.

You can create the same objects using a Map constructor:

// create map of string key and string value
/*
gifts
'first': 'partridge',
'second': 'turtledoves',
'fifth': 'golden rings'

nobleGases
  2: 'helium',
  10: 'neon',
  18: 'argon',
*/
var gifts = {{c1:Map<String, String>();}}
{{c1:gifts['first'] = 'partridge';}}
{{c1:gifts['second'] = 'turtledoves';}}
{{c1:gifts['fifth'] = 'golden rings';}}

var nobleGases = {{c1:Map<int, String>();}}
{{c1:nobleGases[2] = 'helium';}}
{{c1:nobleGases[10] = 'neon';}}
{{c1:nobleGases[18] = 'argon';}}
 Note: If you come from a language like C# or Java, you might expect to see {{c1:new}} Map() instead of just Map(). In Dart, the {{c1:new}} keyword is optional. For details, see Using constructors.

Add a new key-value pair to an existing map using the {{c1:subscript}} assignment operator ({{c1:[]=}}):

var gifts {{c1:= {}}'first': 'partridge'{{c1:}}};

gifts{{c1:[}}'fourth'{{c1:]}} = 'calling birds'; // Add a key-value pair
Retrieve a value from a map using the {{c1:subscript}} operator ({{c1:[]}}):

var gifts = {{c1:{}}'first': 'partridge'{{c1:}}};
assert(gifts{{c1:[}}'first'{{c1:]}} == 'partridge');
If you look for a key that isn’t in a map, you get {{c1:null}} in return:

var gifts = {'first': 'partridge'};
assert(gifts['fifth'] == {{c1:null}});
Use {{c1:.length}} to get the number of key-value pairs in the map:

var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds';
assert(gifts{{c1:.length}} == 2);
To create a map that’s a {{c1:compile-time}} constant, add {{c1:const}} before the map literal:

final constantMap = {{c1:const}} {{c1:{}}
  2: 'helium',
  10: 'neon',
  18: 'argon',
{{c1:}}};

// constantMap[2] = 'Helium'; // This line will cause {{c1:an error}}.
Maps support spread operators ({{c1:...}} and {{c1:...?}}) and collection {{c1:if}} and {{c1:for}}, just like lists do. For details and examples, see the spread operator proposal and the control flow collections proposal.

For more information about maps, see the generics section and the library tour’s coverage of the Maps API.
```

##  Runes and grapheme clusters
```dart
In Dart, runes expose the {{c1:Unicode}} code points of a string. You can use the characters package to view or manipulate user-perceived characters, also known as Unicode (extended) {{c1:grapheme}} clusters.

Unicode defines a {{c1:unique numeric}} value for each letter, digit, and symbol used in all of the world’s writing systems. Because a Dart string is a sequence of {{c1:UTF-16}} code units, expressing Unicode code points within a string requires special syntax. The usual way to express a Unicode code point is {{c1:\uXXXX}}, where XXXX is a 4-digit {{c1:hexadecimal}} value. For example, the heart character (♥) is \u2665. To specify more or less than 4 hex digits, place the value in {{c1:curly brackets}}. For example, the laughing emoji (😆) is \u{{c1:{}}1f606{{c1:}}}.

If you need to read or write individual Unicode characters, use the characters getter defined on String by the {{c1:characters}} package. The returned Characters object is the string as a sequence of {{c1:grapheme clusters}}. Here’s an example of using the characters API:

// import characters api
import '{{c1:package:characters/characters.dart}}';
...
var hi = 'Hi 🇩🇰';
print(hi);
print('The end of the string: ${{{c1:hi.substring(hi.length - 1)}}}');
print('The last character: ${{{c1:hi.characters.last}}}\n');
The output, depending on your environment, looks something like this:

 dart run bin/main.dart
Hi 🇩🇰
The end of the string: ???
The last character: 🇩🇰
For details on using the {{c1:characters}} package to manipulate strings, see the example and API reference for the {{c1:characters}} package.
```

##  Symbols
```dart
A Symbol object represents an {{c1:operator}} or {{c1:identifier}} declared in a Dart program. You might never need to use symbols, but they’re invaluable for APIs that refer to identifiers by name, because {{c1:minification}} changes identifier names but not identifier symbols.

To get the symbol for an identifier, use a {{c1:symbol literal}}, which is just {{c1:#}} followed by the identifier:

{{c1:#}}radix
{{c1:#}}bar

Symbol literals are {{c1:compile-time}} constants.
```

##  Functions
```dart
Dart is a true object-oriented language, so even {{c1:functions}} are objects and have a type, {{c1:Function}}. This means that functions can be assigned to {{c1:variables}} or passed as {{c1:arguments}} to other functions. You can also call an {{c1:instance}} of a Dart class as if it were a {{c1:function}}. For details, see {{c1:Callable}} classes.

Here’s an example of implementing a function:


// function that returns boolean with integer parameter atomicNumber
{{c1:bool}} isNoble({{c1:int atomicNumber}}) {
  return _nobleGases[atomicNumber] != null;
}
Although Effective Dart recommends {{c1:type}} annotations for public APIs, the function still works if you {{c1:omit}} the types:

// function isNonble and parameter: atomicNumber (omit type annotation)
{{c1:isNoble(atomicNumber)}} {
  return _nobleGases[atomicNumber] != null;
}
For functions that contain just one expression, you can use a {{c1:shorthand}} syntax:

bool isNoble(int atomicNumber) {{c1:=>}} _nobleGases[atomicNumber] != null;
The {{c1:=>}} expr syntax is a shorthand for { return expr; }. The => notation is sometimes referred to as {{c1:arrow}} syntax.

 Note: Only an expression—not {{c1:a statement}}—can appear between the arrow ({{c1:=>}}) and the {{c1:semicolon}} ({{c1:;}}). For example, you can’t put an {{c1:if statement}} there, but you can use a {{c1:conditional}} expression.
```

##  Parameters
```dart
A function can have any number of required {{c1:positional}} parameters. These can be followed either by {{c1:named}} parameters or by {{c1:optional}} positional parameters (but not {{c1:both}}).

Note: Some APIs—notably Flutter widget constructors—use only named parameters, even for parameters that are {{c1:mandatory}}. See the next section for details.

You can use {{c1:trailing}} commas when you pass arguments to a function or when you define function parameters.

Named parameters
Named parameters are {{c1:optional}} unless they’re explicitly marked as required.

When defining a function, use {param1, param2, …} to specify named parameters:

/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {...}
When calling a function, you can specify named arguments using paramName: value. For example:

enableFlags(bold: true, hidden: false);
Although it often makes sense to place {{c1:positional}} arguments first, {{c1:named}} arguments can be placed anywhere in the argument list when it suits your API:

repeat(times: 2, () {
  ...
});
 Tip: If a parameter is optional but can’t be null, provide a {{c1:default}} value.

Although named parameters are a kind of {{c1:optional}} parameter, you can annotate them with required to indicate that the parameter is {{c1:mandatory}}—that users must provide a value for the parameter. For example:

const Scrollbar({super.key, {{c1:required}} Widget child});
If someone tries to create a Scrollbar without specifying the child argument, then the analyzer reports an issue.

Optional positional parameters
Wrapping a set of function parameters in {{c1:[]}} marks them as optional positional parameters:

String say(String from, String msg, {{c1:[}}String? device{{c1:]}}) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
Here’s an example of calling this function without the optional parameter:
assert(say('Bob', 'Howdy') == 'Bob says Howdy');
And here’s an example of calling this function with the third parameter:

assert(say('Bob', 'Howdy', 'smoke signal') ==
    'Bob says Howdy with a smoke signal');

Default parameter values
Your function can use = to define default values for optional parameters, both {{c1:named}} and {{c1:positional}}. The default values must be {{c1:compile-time}} constants. If no default value is provided, the default value is {{c1:null}}.

Here’s an example of setting default values for named parameters:

/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold {{c1:=}} false, bool hidden {{c1:=}} false}) {...}

// bold will be true; hidden will be false.
enableFlags({{c1:bold: true}});
 Deprecation note: Old code might use a {{c1:colon}} ({{c1::}}) instead of {{c1:=}} to set default values of named parameters. The reason is that originally, only {{c1::}} was supported for named parameters. That support might be deprecated, so we recommend that you use {{c1:=}} to specify default values.

The next example shows how to set default values for positional parameters:

String say(String from, String msg, {{c1:[}}String device {{c1:=}} 'carrier pigeon'{{c1:]}}) {
  var result = '$from says $msg with a $device';
  return result;
}

assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
You can also pass lists or maps as default values. The following example defines a function, doStuff(), that specifies a default list for the list parameter and a default map for the gifts parameter.

void doStuff(
    {{c1:{}}
      {{c1:List<int>}} list = {{c1:const}} [1, 2, 3],
      {{c1:Map<String, String>}} gifts = {{c1:const}} {{c1:{}}
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    {{c1:}}}
    {{c1:}}}
    ) {
  print('list:  $list');
  print('gifts: $gifts');
}
```

##  The main() function
```dart
Every app must have a {{c1:top-level}} main() function, which serves as the {{c1:entrypoint}} to the app. The main() function returns {{c1:void}} and has an optional {{c1:List<String>}} parameter for arguments.

Here’s a simple main() function:

{{c1:void}} main() {
  print('Hello, World!');
}
Here’s an example of the main() function for a command-line app that takes arguments:

// Run the app like this: dart args.dart 1 test
{{c1:void}} main({{c1:List<String>}} arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
You can use the {{c1:args}} library to define and parse command-line arguments.
```

##  Functions as first-class objects
```dart
You can pass a function as a {{c1:parameter}} to another function. For example:

void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];

// Pass printElement as a parameter and print each element of list
list.{{c1:forEach}}({{c1:printElement}});
You can also assign a function to a {{c1:variable}}, such as:
// save function into variable loudify
{{c1:var}} {{c1:loudify}} = (msg) => '!!! ${msg.toUpperCase()} !!!';

// use variable to call function, pass parameter 'hello' to variable
assert({{c1:loudify}}{{c1:(}}'hello'{{c1:)}} == '!!! HELLO !!!');
This example uses an {{c1:anonymous}} function. More about those in the next section.
```

##  Anonymous functions
```dart
Most functions are named, such as main() or printElement(). You can also create a nameless function called an {{c1:anonymous}} function, or sometimes a {{c1:lambda}} or {{c1:closure}}. You might assign an anonymous function to a {{c1:variable}} so that, for example, you can {{c1:add}} or {{c1:remove}} it from a collection.

An anonymous function looks similar to a named function—{{c1:zero}} or {{c1:more}} parameters, separated by {{c1:commas}} and {{c1:optional}} type annotations, between {{c1:parentheses}}.

The code block that follows contains the function’s body:

([[Type] param1[, …]]) {
  codeBlock;
};

The following example defines an anonymous function with an {{c1:untyped}} parameter, item. The function, invoked for each item in the list, prints a string that includes the value at the specified index.

const list = ['apples', 'bananas', 'oranges'];
list.forEach(({{c1:item}}) {
  print('${list.indexOf({{c1:item}})}: ${{c1:item}}');
});

If the function contains only a {{c1:single}} expression or {{c1:return}} statement, you can shorten it using {{c1:arrow}} notation. Paste the following line into DartPad and click Run to verify that it is functionally equivalent.

list.forEach(({{c1:item}}) => print('${list.indexOf({{c1:item}})}: ${{c1:item}}'));
```

##  Lexical scope
```dart
Dart is a {{c1:lexically}} scoped language, which means that the scope of variables is determined {{c1:statically}}, simply by the layout of the code. You can “follow the {{c1:curly braces}} outwards” to see if a variable is in scope.

Here is an example of nested functions with variables at each scope level:

bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
Notice how nestedFunction() {{c1:can}} use variables from every level, all the way up to the top level.
```

##  Lexical closures
```dart
A closure is a {{c1:function}} object that has access to {{c1:variables}} in its lexical scope, even when the function is used {{c1:outside}} of its original scope.

Functions can close over variables defined in surrounding scopes. In the following example, makeAdder() captures the variable addBy. Wherever the returned function goes, it remembers addBy.

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  // addBy is {{c1:current}} parameter
  // i is {{c1:future}} parameter
  return (int i) => addBy + i;
}

void main() {
  // {{c1:Create}} a function that adds 2.
  var add2 = makeAdder(2);

  // {{c1:Create}} a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
```

##  Testing functions for equality
```dart
Here’s an example of testing {{c1:top-level}} functions, {{c1:static}} methods, and {{c1:instance}} methods for equality:

void foo() {} // A {{c1:top-level}} function

{{c1:class}} A {
  static void bar() {} // A {{c1:static}} method
  void baz() {} // An {{c1:instance}} method
}

void main() {
  Function x;

  // Comparing top-level functions.
  x = foo;
  assert({{c1:foo}} == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.{{c1:bar}} == x);

  // Comparing instance methods.
  var v = {{c1:A()}}; // Instance #1 of A
  var w = {{c1:A()}}; // Instance #2 of A
  var y = w;
  // asssing x to baz method in w
  x = w.{{c1:baz}};

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.{{c1:baz}} == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.{{c1:baz}} != w.{{c1:baz}});
}
```

##  Return values
```dart
All functions return a {{c1:value}}. If no return value is specified, the statement return {{c1:null}}; is {{c1:implicitly}} appended to the function body.

foo() {}

assert(foo() == null);
```

##  Operators
```dart
Dart supports the operators shown in the following table. You can implement many of these operators as class members.

Description	Operator
unary postfix  ===>	                expr++    expr--    ()    []    ?[]    .    ?.    !
unary prefix	 ===>                 -expr    !expr    ~expr    ++expr    --expr      await expr   
multiplicative ===>	                    *    /    %  ~/
additive	===>                          +    -
shift	===>                              <<    >>    >>>
bitwise AND	===>                        &
bitwise XOR	===>                        ^
bitwise OR	===>                        |
relational and type test ===>         	>=    >    <=    <    as    is    is!
equality	===>                          ==    !=   
logical AND	===>                        &&
logical OR	===>                        ||
if null	??
conditional	===>                        expr1 ? expr2 : expr3
cascade	 ===>                           ..    ?..
assignment	===>                        =    *=    /=   +=   -=   &=   ^=   etc.
 Warning: Operator precedence is an approximation of the behavior of a Dart parser. For definitive answers, consult the grammar in the Dart language specification.

When you use operators, you create {{c1:expressions}}. Here are some examples of operator expressions:

a++
a + b
a = b
a == b
c ? a : b
a is T
In the operator table, each operator has higher {{c1:precedence}} than the operators in the rows that follow it. For example, the multiplicative operator % has higher precedence than (and thus executes before) the equality operator ==, which has higher precedence than the logical AND operator &&. That precedence means that the following two lines of code execute the same way:

// Parentheses improve {{c1:readability}}.
if ((n % i == 0) && (d % i == 0)) ...

// Harder to read, but equivalent.
if (n % i == 0 && d % i == 0) ...
 Warning: For operators that take two operands, the {{c1:leftmost}} operand determines which method is used. For example, if you have a Vector object and a Point object, then aVector + aPoint uses Vector addition (+).
```

##  Arithmetic operators
```dart
Arithmetic operators
Dart supports the usual arithmetic operators, as shown in the following table.

Operator	Meaning
+	Add
-	Subtract
-expr	{{c1:Unary minus}}, also known as {{c1:negation}} (reverse the sign of the expression)
*	Multiply
/	Divide
~/	{{c1:Divide}}, returning an {{c1:integer}} result
%	Get the remainder of an integer division ({{c1:modulo}})
Example:

assert(2 + 3 == 5);
assert(2 - 3 == -1);
assert(2 * 3 == 6);
assert(5 / 2 == 2.5); // Result is a double
assert(5 ~/ 2 == 2); // Result is an int
assert(5 % 2 == 1); // Remainder

assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
Dart also supports both {{c1:prefix}} and {{c1:postfix}} increment and decrement operators.

Operator	Meaning
++var	    ===>  var = var + 1 (expression value is {{c1:var + 1}})
var++	    ===>  var = var + 1 (expression value is {{c1:var}})
--var	    ===>  var = var - 1 (expression value is {{c1:var - 1}})
var--	    ===>  var = var - 1 (expression value is {{c1:var}})
Example:

int a;
int b;

a = 0;
b = ++a; // Increment a {{c1:before}} b gets its value.
assert(a == b); // 1 == 1

a = 0;
b = a++; // Increment a {{c1:AFTER}} b gets its value.
assert(a != b); // 1 != 0

a = 0;
b = --a; // Decrement a {{c1:before}} b gets its value.
assert(a == b); // -1 == -1

a = 0;
b = a--; // Decrement a {{c1:AFTER}} b gets its value.
assert(a != b); // -1 != 0
```

##  Equality and relational operators
```dart
The following table lists the meanings of equality and relational operators.

Operator	Meaning
==        ===> Equal; see discussion below
!=        ===> Not equal
>	        ===> Greater than
<	        ===> Less than
>=        ===> Greater than or equal to
<=        ===> Less than or equal to
To test whether two objects x and y represent the same thing, use the == operator. (In the rare case where you need to know whether two objects are the exact same object, use the {{c1:identical()}} function instead.) Here’s how the == operator works:

If x or y is null, return true if both are null, and false if only one is null.

Return the result of invoking the == method on x with the argument y. (That’s right, operators such as == are methods that are invoked on their {{c1:first}} operand. For details, see Operators.)

Here’s an example of using each of the equality and relational operators:

assert(2 == 2);
assert(2 != 3);
assert(3 > 2);
assert(2 < 3);
assert(3 >= 3);
assert(2 <= 3);
```

##  Type test operators
```dart
The {{c1:as}}, {{c1:is}}, and {{c1:is!}} operators are handy for checking types at runtime.

Operator	Meaning
as	      ===> Typecast (also used to specify {{c1:library}} prefixes)
is	      ===> True if the object has the specified {{c1:type}}
is!     	===> True if the object doesn’t have the specified {{c1:type}}
The result of obj is T is true if obj implements the {{c1:interface}} specified by T. For example, obj is Object? is always true.

Use the as operator to cast an object to a particular type if and only if you are sure that the object is of that {{c1:type}}. Example:

{{c1:(}}employee {{c1:as}} Person{{c1:)}}.firstName = 'Bob';
If you aren’t sure that the object is of type T, then use is T to check the {{c1:type}} before using the object.

if (employee is Person) {
  // Type check
  employee.firstName = 'Bob';
}
 Note: The code isn’t equivalent. If employee is {{c1:null}} or not a {{c1:Person}}, the first example throws an {{c1:exception}}; the second does {{c1:nothing}}.
```

##  Assignment operators
```dart
As you’ve already seen, you can assign values using the = operator. To assign only if the assigned-to variable is null, use the {{c1:??=}} operator.

// Assign value to a
a = value;
// Assign value to b if b is null; otherwise, b stays the same
b {{c1:??=}} value;
{{c1:Compound}} assignment operators such as {{c1:+=}} combine an operation with an assignment.

=	*=	%=	>>>=	^=
+=	/=	<<=	&=	|=
-=	~/=	>>=	 	 
Here’s how compound assignment operators work:

 	Compound assignment	Equivalent expression
For an operator op:	(a {{c1:op=}} b)	 ===>  (a = a op b)
Example:	a += b	a = a + b
The following example uses assignment and compound assignment operators:

var a = 2; // Assign using =
a *= 3; // Assign and multiply: a = a * 3
assert(a == 6);
```

##  Logical operators
```dart
You can {{c1:invert}} or {{c1:combine}} boolean expressions using the logical operators.

Operator	Meaning
{{c1:!}}expr	inverts the following expression (changes false to true, and vice versa)
{{c1:||}}	logical OR
{{c1:&&}}	logical AND
Here’s an example of using the logical operators:

if (!done && (col == 0 || col == 3)) {
  // ...Do something...
}
```

##  Bitwise and shift operators
```dart
You can manipulate the individual bits of numbers in Dart. Usually, you’d use these bitwise and shift operators with integers.

Operator	Meaning
&	        ===> {{c1:AND}}
|	        ===> {{c1:OR}}
^	        ===> {{c1:XOR}}
~expr	Unary bitwise {{c1:complement}} (0s become 1s; 1s become 0s)
<<	{{c1:Shift}} {{c1:left}}
>>	{{c1:Shift}} {{c1:right}}
>>>	{{c1:Unsigned}} {{c1:shift}} {{c1:right}}
Here’s an example of using bitwise and shift operators:

final value = 0x22;
final bitmask = 0x0f;

assert((value & bitmask) == 0x02); // AND
assert((value & ~bitmask) == 0x20); // AND NOT
assert((value | bitmask) == 0x2f); // OR
assert((value ^ bitmask) == 0x2d); // XOR
assert((value << 4) == 0x220); // Shift left
assert((value >> 4) == 0x02); // Shift right
assert((value >>> 4) == 0x02); // Unsigned shift right
assert((-value >> 4) == -0x03); // Shift right
assert((-value >>> 4) > 0); // Unsigned shift right
 Version note: The >>> operator (known as {{c1:triple-shift}} or {{c1:unsigned shift}}) requires a language version of at least 2.14.
```

##  Conditional expressions
```dart
Dart has two operators that let you concisely evaluate expressions that might otherwise require if-else statements:

{{c1:condition}} {{c1:?}} expr1 {{c1::}} expr2
If condition is {{c1:true}}, evaluates expr1 (and returns its value); otherwise, evaluates and returns the value of expr2.


expr1 {{c1:??}} expr2
If expr1 is non-null, returns its value; otherwise, evaluates and returns the value of expr2.

When you need to assign a value based on a boolean expression, consider using {{c1:?}} and {{c1::.}}

var visibility = isPublic ? 'public' : 'private';
If the boolean expression tests for null, consider using ??.

String playerName(String? name) => name ?? 'Guest';
The previous example could have been written at least two other ways, but not as succinctly:

// Slightly longer version uses ?: operator.
String playerName(String? name) => name != null ? name : 'Guest';

// Very long version uses if-else statement.
String playerName(String? name) {
  if (name != null) {
    return name;
  } else {
    return 'Guest';
  }
}
```

##  Cascade notation
```dart
Cascades ({{c1:..}}, {{c1:?..}}) allow you to make a sequence of {{c1:operations}} on the same object. In addition to accessing {{c1:instance members}}, you can also call {{c1:instance methods}} on that same object. This often saves you the step of creating a {{c1:temporary}} {{c1:variable}} and allows you to write more fluid code.

Consider the following code:

var paint = Paint()
  {{c1:..}}color = Colors.black
  {{c1:..}}strokeCap = StrokeCap.round
  {{c1:..}}strokeWidth = 5.0;
The constructor, Paint(), returns a Paint object. The code that follows the {{c1:cascade}} notation operates on this object, {{c1:ignoring}} any values that might be returned.

The previous example is equivalent to this code:

var paint = Paint(){{c1:;}}
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
If the object that the cascade operates on can be null, then use a {{c1:null-shorting}} cascade ({{c1:?..}}) for the first operation. Starting with {{c1:?..}} guarantees that none of the cascade operations are attempted on that null object.

querySelector('#confirm') // Get an object.
  {{c1:?..}}text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
 Version note: The {{c1:?..}} syntax requires a language version of at least 2.12.

The previous code is equivalent to the following:

{{c1:var}} button {{c1:=}} querySelector('#confirm'){{c1:;}}
button{{c1:?.}}text = 'Confirm';
button{{c1:?.}}classes.add('important');
button{{c1:?.}}onClick.listen((e) => window.alert('Confirmed!'));
button{{c1:?.}}scrollIntoView();

You can also nest cascades. For example:

final addressBook = {{c1:(}}AddressBookBuilder{{c1:()}}
      {{c1:..}}name = 'jenny'
      {{c1:..}}email = 'jenny@example.com'
      {{c1:..}}phone = {{c1:(}}PhoneNumberBuilder{{c1:()}}
            {{c1:..}}number = '415-555-0100'
            {{c1:..}}label = 'home'{{c1:)}}
          {{c1:.}}build{{c1:()}}{{c1:)}}
    {{c1:.}}build{{c1:()}};

Be careful to construct your cascade on a function that returns an {{c1:actual}} object. For example, the following code fails:

var sb = StringBuffer();
sb.write('foo')
  ..write('bar'); // Error: method 'write' isn't defined for '{{c1:void}}'.

The sb.write() call returns {{c1:void}}, and you can’t construct a cascade on {{c1:void}}.

 Note: Strictly speaking, the “{{c1:double dot}}” notation for cascades isn’t an operator. It’s just part of the Dart syntax.
```

##  Other operators
```dart
You’ve seen most of the remaining operators in other examples:

Operator	Name	Meaning
{{c1:()}}	Function application	Represents a function call

[]	{{c1:Subscript}} {{c1:access}}	Represents a call to the {{c1:overridable}} {{c1:[]}} operator; example: fooList[1] passes the int 1 to fooList to access the element at index 1


{{c1:?[]}}	Conditional subscript access	Like [], but the leftmost operand can be null; example: fooList?[1] passes the int 1 to fooList to access the element at index 1 unless fooList is null (in which case the expression evaluates to {{c1:null}})


.	{{c1:Member}} access	Refers to a {{c1:property}} of an expression; example: foo.bar selects property bar from {{c1:expression}} foo


{{c1:?.}}	Conditional member access	Like ., but the leftmost operand can be null; example: foo?.bar selects property bar from expression foo unless foo is null (in which case the value of foo?.bar is {{c1:null}})


!	{{c1:Null}} {{c1:assertion}} operator	Casts an {{c1:expression}} to its underlying {{c1:non-nullable}} type, throwing a {{c1:runtime}} exception if the cast fails; example: foo{{c1:!.}}bar asserts foo is non-null and selects the property bar, unless foo is null in which case a runtime exception is thrown


For more information about the ., ?., and .. operators, see Classes.
```

##  Control flow statements
```dart
You can control the flow of your Dart code using any of the following:

if and else
for loops
while and do-while loops
break and continue
switch and case
assert
You can also affect the control flow using try-catch and throw, as explained in Exceptions.
```

##  If and else
```dart
Dart supports if statements with {{c1:optional}} else statements, as the next sample shows. Also see conditional expressions.

if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}
The statement conditions must be {{c1:expressions}} that evaluate to boolean values, nothing else. See Booleans for more information.
```

##  For loops
```dart
You can {{c1:iterate}} with the standard for loop. For example:


var message = {{c1:StringBuffer}}('Dart is fun');
for (var i = 0; i < 5; i++) {
  message.write('!');
}
Closures inside of Dart’s for loops {{c1:capture}} the value of the index, avoiding a common {{c1:pitfall}} found in JavaScript. For example, consider:

var callbacks = [];

for (var i = 0; i < 2; i++) {
  callbacks.{{c1:add}}({{c1:()}} {{c1:=>}} print(i));
}
callbacks.{{c1:forEach}}({{c1:(c)}} => {{c1:c()}});



The output is 0 and then 1, as expected. In contrast, the example would print {{c1:2}} and then {{c1:2}} in JavaScript.

If the object that you are iterating over is an Iterable (such as List or Set) and if you don’t need to know the current iteration counter, you can use the {{c1:for-in}} form of iteration:

{{c1:for}} (final candidate {{c1:in}} candidates) {
  candidate.interview();
}
 Tip: To practice using for-in, follow the Iterable collections codelab.

Iterable classes also have a {{c1:forEach()}} method as another option:

var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3
```

##  While and do-while
```dart
A while {{c1:loop}} evaluates the {{c1:condition}} before the loop:

while (!isDone()) {
  doSomething();
}
A do-while {{c1:loop}} evaluates the condition {{c1:after}} the loop:

do {
  printLine();
} while (!atEndOfPage());
```

##  Break and continue
```dart
Use break to {{c1:stop}} looping:

while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}
Use continue to {{c1:skip}} to the next loop iteration:

for (int i = 0; i < candidates.length; i++) {
  var candidate = candidates[i];
  if (candidate.yearsExperience < 5) {
    continue;
  }
  candidate.interview();
}

You might write that example differently if you’re using an {{c1:Iterable}} such as a list or set:

candidates
    .{{c1:where}}((c) => c.yearsExperience >= 5)
    .{{c1:forEach}}((c) => c.interview());
```

##  Switch and case
```dart
Switch statements in Dart compare integer, string, or compile-time constants using ==. The compared objects must all be instances of the same class (and not of any of its subtypes), and the class must not override ==. Enumerated types work well in switch statements.

Each non-empty case clause ends with a break statement, as a rule. Other valid ways to end a non-empty case clause are a continue, throw, or return statement.

Use a default clause to execute code when no case clause matches:

var command = 'OPEN';
switch (command) {
  case 'CLOSED':
    executeClosed();
    break;
  case 'PENDING':
    executePending();
    break;
  case 'APPROVED':
    executeApproved();
    break;
  case 'DENIED':
    executeDenied();
    break;
  case 'OPEN':
    executeOpen();
    break;
  default:
    executeUnknown();
}
The following example omits the break statement in a case clause, thus generating an error:

var command = 'OPEN';
switch (command) {
  case 'OPEN':
    executeOpen();
    // ERROR: Missing break

  case 'CLOSED':
    executeClosed();
    break;
}
However, Dart does support empty case clauses, allowing a form of fall-through:

var command = 'CLOSED';
switch (command) {
  case 'CLOSED': // Empty case falls through.
  case 'NOW_CLOSED':
    // Runs for both CLOSED and NOW_CLOSED.
    executeNowClosed();
    break;
}
If you really want fall-through, you can use a continue statement and a label:

var command = 'CLOSED';
switch (command) {
  case 'CLOSED':
    executeClosed();
    continue nowClosed;
  // Continues executing at the nowClosed label.

  nowClosed:
  case 'NOW_CLOSED':
    // Runs for both CLOSED and NOW_CLOSED.
    executeNowClosed();
    break;
}
A case clause can have local variables, which are visible only inside the scope of that clause.
```

##  Assert
```dart
During development, use an assert statement—assert(condition, optionalMessage);—to disrupt normal execution if a boolean condition is false. You can find examples of assert statements throughout this tour. Here are some more:

// Make sure the variable has a non-null value.
assert(text != null);

// Make sure the value is less than 100.
assert(number < 100);

// Make sure this is an https URL.
assert(urlString.startsWith('https'));
To attach a message to an assertion, add a string as the second argument to assert (optionally with a trailing comma):

assert(urlString.startsWith('https'),
    'URL ($urlString) should start with "https".');
The first argument to assert can be any expression that resolves to a boolean value. If the expression’s value is true, the assertion succeeds and execution continues. If it’s false, the assertion fails and an exception (an AssertionError) is thrown.

When exactly do assertions work? That depends on the tools and framework you’re using:

Flutter enables assertions in debug mode.
Development-only tools such as dartdevc typically enable assertions by default.
Some tools, such as dart run and dart2js support assertions through a command-line flag: --enable-asserts.
In production code, assertions are ignored, and the arguments to assert aren’t evaluated.
```

##  Exceptions
```dart
Your Dart code can throw and catch exceptions. Exceptions are errors indicating that something unexpected happened. If the exception isn’t caught, the isolate that raised the exception is suspended, and typically the isolate and its program are terminated.

In contrast to Java, all of Dart’s exceptions are unchecked exceptions. Methods don’t declare which exceptions they might throw, and you aren’t required to catch any exceptions.

Dart provides Exception and Error types, as well as numerous predefined subtypes. You can, of course, define your own exceptions. However, Dart programs can throw any non-null object—not just Exception and Error objects—as an exception.
```

##  Throw
```dart
Here’s an example of throwing, or raising, an exception:

throw FormatException('Expected at least 1 section');
You can also throw arbitrary objects:

throw 'Out of llamas!';
 Note: Production-quality code usually throws types that implement Error or Exception.

Because throwing an exception is an expression, you can throw exceptions in => statements, as well as anywhere else that allows expressions:

void distanceTo(Point other) => throw UnimplementedError();
```

##  Catch
```dart
Catching, or capturing, an exception stops the exception from propagating (unless you rethrow the exception). Catching an exception gives you a chance to handle it:

try {
  breedMoreLlamas();
} on OutOfLlamasException {
  buyMoreLlamas();
}
To handle code that can throw more than one type of exception, you can specify multiple catch clauses. The first catch clause that matches the thrown object’s type handles the exception. If the catch clause does not specify a type, that clause can handle any type of thrown object:

try {
  breedMoreLlamas();
} on OutOfLlamasException {
  // A specific exception
  buyMoreLlamas();
} on Exception catch (e) {
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e) {
  // No specified type, handles all
  print('Something really unknown: $e');
}
As the preceding code shows, you can use either on or catch or both. Use on when you need to specify the exception type. Use catch when your exception handler needs the exception object.

You can specify one or two parameters to catch(). The first is the exception that was thrown, and the second is the stack trace (a StackTrace object).

try {
  // ···
} on Exception catch (e) {
  print('Exception details:\n $e');
} catch (e, s) {
  print('Exception details:\n $e');
  print('Stack trace:\n $s');
}
To partially handle an exception, while allowing it to propagate, use the rethrow keyword.

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
```

##  Finally
```dart
To ensure that some code runs whether or not an exception is thrown, use a finally clause. If no catch clause matches the exception, the exception is propagated after the finally clause runs:

try {
  breedMoreLlamas();
} finally {
  // Always clean up, even if an exception is thrown.
  cleanLlamaStalls();
}
The finally clause runs after any matching catch clauses:

try {
  breedMoreLlamas();
} catch (e) {
  print('Error: $e'); // Handle the exception first.
} finally {
  cleanLlamaStalls(); // Then clean up.
}
Learn more by reading the Exceptions section of the library tour.
```

##  Classes
```dart
Dart is an object-oriented language with classes and mixin-based inheritance. Every object is an instance of a class, and all classes except Null descend from Object. Mixin-based inheritance means that although every class (except for the top class, Object?) has exactly one superclass, a class body can be reused in multiple class hierarchies. Extension methods are a way to add functionality to a class without changing the class or creating a subclass.
```

##  Using class members
```dart
Objects have members consisting of functions and data (methods and instance variables, respectively). When you call a method, you invoke it on an object: the method has access to that object’s functions and data.

Use a dot (.) to refer to an instance variable or method:

var p = Point(2, 2);

// Get the value of y.
assert(p.y == 2);

// Invoke distanceTo() on p.
double distance = p.distanceTo(Point(4, 4));
Use ?. instead of . to avoid an exception when the leftmost operand is null:

// If p is non-null, set a variable equal to its y value.
var a = p?.y;
```

##  Using constructors
```dart
You can create an object using a constructor. Constructor names can be either ClassName or ClassName.identifier. For example, the following code creates Point objects using the Point() and Point.fromJson() constructors:

var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
The following code has the same effect, but uses the optional new keyword before the constructor name:

var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
Some classes provide constant constructors. To create a compile-time constant using a constant constructor, put the const keyword before the constructor name:

var p = const ImmutablePoint(2, 2);
Constructing two identical compile-time constants results in a single, canonical instance:

var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);

assert(identical(a, b)); // They are the same instance!
Within a constant context, you can omit the const before a constructor or literal. For example, look at this code, which creates a const map:

// Lots of const keywords here.
const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
You can omit all but the first use of the const keyword:

// Only one const, which establishes the constant context.
const pointAndLine = {
  'point': [ImmutablePoint(0, 0)],
  'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};
If a constant constructor is outside of a constant context and is invoked without const, it creates a non-constant object:

var a = const ImmutablePoint(1, 1); // Creates a constant
var b = ImmutablePoint(1, 1); // Does NOT create a constant

assert(!identical(a, b)); // NOT the same instance!
```

##  Getting an object’s type
```dart
To get an object’s type at runtime, you can use the Object property runtimeType, which returns a Type object.

print('The type of a is ${a.runtimeType}');
 Use a type test operator rather than runtimeType to test an object’s type. In production environments, the test object is Type is more stable than the test object.runtimeType == Type.

Up to here, you’ve seen how to use classes. The rest of this section shows how to implement classes.

```

##  Instance variables
```dart

Instance variables
Here’s how you declare instance variables:

class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double z = 0; // Declare z, initially 0.
}
All uninitialized instance variables have the value null.

All instance variables generate an implicit getter method. Non-final instance variables and late final instance variables without initializers also generate an implicit setter method. For details, see Getters and setters.

If you initialize a non-late instance variable where it’s declared, the value is set when the instance is created, which is before the constructor and its initializer list execute.

class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

void main() {
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
}
Instance variables can be final, in which case they must be set exactly once. Initialize final, non-late instance variables at declaration, using a constructor parameter, or using a constructor’s initializer list:

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}
If you need to assign the value of a final instance variable after the constructor body starts, you can use one of the following:

Use a factory constructor.
Use late final, but be careful: a late final without an initializer adds a setter to the API.
```

##  Constructors
```dart
Declare a constructor by creating a function with the same name as its class (plus, optionally, an additional identifier as described in Named constructors). The most common form of constructor, the generative constructor, creates a new instance of a class:

class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    // See initializing formal parameters for a better way
    // to initialize instance variables.
    this.x = x;
    this.y = y;
  }
}
The this keyword refers to the current instance.

 Note: Use this only when there is a name conflict. Otherwise, Dart style omits the this.

Initializing formal parameters
The pattern of assigning a constructor argument to an instance variable is so common, Dart has initializing formal parameters to make it easy.

Initializing parameters can also be used to initialize non-nullable or final instance variables, which both must be initialized or provided a default value.

class Point {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Point(this.x, this.y);
}
The variables introduced by the initializing formals are implicitly final and only in scope of the initializer list.

Default constructors
If you don’t declare a constructor, a default constructor is provided for you. The default constructor has no arguments and invokes the no-argument constructor in the superclass.

Constructors aren’t inherited
Subclasses don’t inherit constructors from their superclass. A subclass that declares no constructors has only the default (no argument, no name) constructor.

Named constructors
Use a named constructor to implement multiple constructors for a class or to provide extra clarity:

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}
Remember that constructors are not inherited, which means that a superclass’s named constructor is not inherited by a subclass. If you want a subclass to be created with a named constructor defined in the superclass, you must implement that constructor in the subclass.

Invoking a non-default superclass constructor
By default, a constructor in a subclass calls the superclass’s unnamed, no-argument constructor. The superclass’s constructor is called at the beginning of the constructor body. If an initializer list is also being used, it executes before the superclass is called. In summary, the order of execution is as follows:

initializer list
superclass’s no-arg constructor
main class’s no-arg constructor
If the superclass doesn’t have an unnamed, no-argument constructor, then you must manually call one of the constructors in the superclass. Specify the superclass constructor after a colon (:), just before the constructor body (if any).

In the following example, the constructor for the Employee class calls the named constructor for its superclass, Person. Click Run to execute the code.


Because the arguments to the superclass constructor are evaluated before invoking the constructor, an argument can be an expression such as a function call:

class Employee extends Person {
  Employee() : super.fromJson(fetchDefaultData());
  // ···
}
 Warning: Arguments to the superclass constructor don’t have access to this. For example, arguments can call static methods but not instance methods.

To avoid having to manually pass each parameter into the super invocation of a constructor, you can use super-initializer parameters to forward parameters to the specified or default superclass constructor. This feature can’t be used with redirecting constructors. Super-initializer parameters have similar syntax and semantics to initializing formal parameters:

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}
Super-initializer parameters cannot be positional if the super-constructor invocation already has positional arguments, but they can always be named:

class Vector2d {
  // ...

  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  // ...

  // Forward the y parameter to the named super constructor like:
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}
 Version note: Using super-initializer parameters requires a language version of at least 2.17. If you’re using an earlier language version, you must manually pass in all super constructor parameters.

Initializer list
Besides invoking a superclass constructor, you can also initialize instance variables before the constructor body runs. Separate initializers with commas.

// Initializer list sets instance variables before
// the constructor body runs.
Point.fromJson(Map<String, double> json)
    : x = json['x']!,
      y = json['y']! {
  print('In Point.fromJson(): ($x, $y)');
}
 Warning: The right-hand side of an initializer doesn’t have access to this.

During development, you can validate inputs by using assert in the initializer list.

Point.withAssert(this.x, this.y) : assert(x >= 0) {
  print('In Point.withAssert(): ($x, $y)');
}
Initializer lists are handy when setting up final fields. The following example initializes three final fields in an initializer list. Click Run to execute the code.




Redirecting constructors
Sometimes a constructor’s only purpose is to redirect to another constructor in the same class. A redirecting constructor’s body is empty, with the constructor call (using this instead of the class name) appearing after a colon (:).

class Point {
  double x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);
}
Constant constructors
If your class produces objects that never change, you can make these objects compile-time constants. To do this, define a const constructor and make sure that all instance variables are final.

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
Constant constructors don’t always create constants. For details, see the section on using constructors.

Factory constructors
Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class. For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype. Another use case for factory constructors is initializing a final variable using logic that can’t be handled in the initializer list.

 Tip: Another way to handle late initialization of a final variable is to use late final (carefully!).

In the following example, the Logger factory constructor returns objects from a cache, and the Logger.fromJson factory constructor initializes a final variable from a JSON object.

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
 Note: Factory constructors have no access to this.

Invoke a factory constructor just like you would any other constructor:

var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);

```

##  Methods
```dart
Methods are functions that provide behavior for an object.

Instance methods
Instance methods on objects can access instance variables and this. The distanceTo() method in the following sample is an example of an instance method:

import 'dart:math';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

Operators
Operators are instance methods with special names. Dart allows you to define operators with the following names:

<	+	|	>>>
>	/	^	[]
<=	~/	&	[]=
>=	*	<<	~
-	%	>>	==
 Note: You may have noticed that some operators, like !=, aren’t in the list of names. That’s because they’re just syntactic sugar. For example, the expression e1 != e2 is syntactic sugar for !(e1 == e2).

An operator declaration is identified using the built-in identifier operator. The following example defines vector addition (+) and subtraction (-):

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown.
  // ···
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
Getters and setters
Getters and setters are special methods that provide read and write access to an object’s properties. Recall that each instance variable has an implicit getter, plus a setter if appropriate. You can create additional properties by implementing getters and setters, using the get and set keywords:

class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
With getters and setters, you can start with instance variables, later wrapping them with methods, all without changing client code.

 Note: Operators such as increment (++) work in the expected way, whether or not a getter is explicitly defined. To avoid any unexpected side effects, the operator calls the getter exactly once, saving its value in a temporary variable.

Abstract methods
Instance, getter, and setter methods can be abstract, defining an interface but leaving its implementation up to other classes. Abstract methods can only exist in abstract classes.

To make a method abstract, use a semicolon (;) instead of a method body:

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}
```

##  Abstract classes
```dart
Use the abstract modifier to define an abstract class—a class that can’t be instantiated. Abstract classes are useful for defining interfaces, often with some implementation. If you want your abstract class to appear to be instantiable, define a factory constructor.

Abstract classes often have abstract methods. Here’s an example of declaring an abstract class that has an abstract method:

// This class is declared abstract and thus
// can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}
```

##  Implicit interfaces
```dart
Every class implicitly defines an interface containing all the instance members of the class and of any interfaces it implements. If you want to create a class A that supports class B’s API without inheriting B’s implementation, class A should implement the B interface.

A class implements one or more interfaces by declaring them in an implements clause and then providing the APIs required by the interfaces. For example:

// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
}
Here’s an example of specifying that a class implements multiple interfaces:

class Point implements Comparable, Location {...}
```

##  Extending a class
```dart
Use extends to create a subclass, and super to refer to the superclass:

class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  // ···
}
For another usage of extends, see the discussion of parameterized types in generics.


Overriding members
Subclasses can override instance methods (including operators), getters, and setters. You can use the @override annotation to indicate that you are intentionally overriding a member:

class Television {
  // ···
  set contrast(int value) {...}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {...}
  // ···
}
An overriding method declaration must match the method (or methods) that it overrides in several ways:

The return type must be the same type as (or a subtype of) the overridden method’s return type.
Argument types must be the same type as (or a supertype of) the overridden method’s argument types. In the preceding example, the contrast setter of SmartTelevision changes the argument type from int to a supertype, num.
If the overridden method accepts n positional parameters, then the overriding method must also accept n positional parameters.
A generic method can’t override a non-generic one, and a non-generic method can’t override a generic one.
Sometimes you might want to narrow the type of a method parameter or an instance variable. This violates the normal rules, and it’s similar to a downcast in that it can cause a type error at runtime. Still, narrowing the type is possible if the code can guarantee that a type error won’t occur. In this case, you can use the covariant keyword in a parameter declaration. For details, see the Dart language specification.

 Warning: If you override ==, you should also override Object’s hashCode getter. For an example of overriding == and hashCode, see Implementing map keys.

noSuchMethod()
To detect or react whenever code attempts to use a non-existent method or instance variable, you can override noSuchMethod():

class A {
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}
You can’t invoke an unimplemented method unless one of the following is true:

The receiver has the static type dynamic.

The receiver has a static type that defines the unimplemented method (abstract is OK), and the dynamic type of the receiver has an implementation of noSuchMethod() that’s different from the one in class Object.

For more information, see the informal noSuchMethod forwarding specification.


```

##  Extension methods
```dart
Extension methods are a way to add functionality to existing libraries. You might use extension methods without even knowing it. For example, when you use code completion in an IDE, it suggests extension methods alongside regular methods.

Here’s an example of using an extension method on String named parseInt() that’s defined in string_apis.dart:

import 'string_apis.dart';
...
print('42'.padLeft(5)); // Use a String method.
print('42'.parseInt()); // Use an extension method.
For details of using and implementing extension methods, see the extension methods page.
```

##  Enumerated types
```dart
Enumerated types, often called enumerations or enums, are a special kind of class used to represent a fixed number of constant values.

 Note: All enums automatically extend the Enum class. They are also sealed, meaning they cannot be subclassed, implemented, mixed in, or otherwise explicitly instantiated.

Abstract classes and mixins can explicitly implement or extend Enum, but unless they are then implemented by or mixed into an enum declaration, no objects can actually implement the type of that class or mixin.

Declaring simple enums
To declare a simple enumerated type, use the enum keyword and list the values you want to be enumerated:

enum Color { red, green, blue }
 Tip: You can also use trailing commas when declaring an enumerated type to help prevent copy-paste errors.

Declaring enhanced enums
Dart also allows enum declarations to declare classes with fields, methods, and const constructors which are limited to a fixed number of known constant instances.

To declare an enhanced enum, follow a syntax similar to normal classes, but with a few extra requirements:

Instance variables must be final, including those added by mixins.
All generative constructors must be constant.
Factory constructors can only return one of the fixed, known enum instances.
No other class can be extended as Enum is automatically extended.
There cannot be overrides for index, hashCode, the equality operator ==.
A member named values cannot be declared in an enum, as it would conflict with the automatically generated static values getter.
All instances of the enum must be declared in the beginning of the declaration, and there must be at least one instance declared.
Here is an example that declares an enhanced enum with multiple instances, instance variables, a getter, and an implemented interface:

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
To learn more about declaring enhanced enums, see the section on Classes.

 Version note: Enhanced enums require a language version of at least 2.17.

Using enums
Access the enumerated values like any other static variable:

final favoriteColor = Color.blue;
if (favoriteColor == Color.blue) {
  print('Your favorite color is blue!');
}
Each value in an enum has an index getter, which returns the zero-based position of the value in the enum declaration. For example, the first value has index 0, and the second value has index 1.

assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);
To get a list of all the enumerated values, use the enum’s values constant.

List<Color> colors = Color.values;
assert(colors[2] == Color.blue);
You can use enums in switch statements, and you’ll get a warning if you don’t handle all of the enum’s values:

var aColor = Color.blue;

switch (aColor) {
  case Color.red:
    print('Red as roses!');
    break;
  case Color.green:
    print('Green as grass!');
    break;
  default: // Without this, you see a WARNING.
    print(aColor); // 'Color.blue'
}
If you need to access the name of an enumerated value, such as 'blue' from Color.blue, use the .name property:

print(Color.blue.name); // 'blue'
```

##  Adding features to a class: mixins
```dart
Mixins are a way of reusing a class’s code in multiple class hierarchies.

To use a mixin, use the with keyword followed by one or more mixin names. The following example shows two classes that use mixins:

class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
To implement a mixin, create a class that extends Object and declares no constructors. Unless you want your mixin to be usable as a regular class, use the mixin keyword instead of class. For example:

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
Sometimes you might want to restrict the types that can use a mixin. For example, the mixin might depend on being able to invoke a method that the mixin doesn’t define. As the following example shows, you can restrict a mixin’s use by using the on keyword to specify the required superclass:

class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
In the preceding code, only classes that extend or implement the Musician class can use the mixin MusicalPerformer. Because SingerDancer extends Musician, SingerDancer can mix in MusicalPerformer.
```

##  Class variables and methods
```dart
Use the static keyword to implement class-wide variables and methods.

Static variables
Static variables (class variables) are useful for class-wide state and constants:

class Queue {
  static const initialCapacity = 16;
  // ···
}

void main() {
  assert(Queue.initialCapacity == 16);
}
Static variables aren’t initialized until they’re used.

 Note: This page follows the style guide recommendation of preferring lowerCamelCase for constant names.

Static methods
Static methods (class methods) don’t operate on an instance, and thus don’t have access to this. They do, however, have access to static variables. As the following example shows, you invoke static methods directly on a class:

import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
 Note: Consider using top-level functions, instead of static methods, for common or widely used utilities and functionality.

You can use static methods as compile-time constants. For example, you can pass a static method as a parameter to a constant constructor.
```

##  Generics
```dart
If you look at the API documentation for the basic array type, List, you’ll see that the type is actually List<E>. The <…> notation marks List as a generic (or parameterized) type—a type that has formal type parameters. By convention, most type variables have single-letter names, such as E, T, S, K, and V.
```

##  Why use generics?
```dart
Generics are often required for type safety, but they have more benefits than just allowing your code to run:

Properly specifying generic types results in better generated code.
You can use generics to reduce code duplication.
If you intend for a list to contain only strings, you can declare it as List<String> (read that as “list of string”). That way you, your fellow programmers, and your tools can detect that assigning a non-string to the list is probably a mistake. Here’s an example:

var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Error
Another reason for using generics is to reduce code duplication. Generics let you share a single interface and implementation between many types, while still taking advantage of static analysis. For example, say you create an interface for caching an object:

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}
You discover that you want a string-specific version of this interface, so you create another interface:

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}
Later, you decide you want a number-specific version of this interface… You get the idea.

Generic types can save you the trouble of creating all these interfaces. Instead, you can create a single interface that takes a type parameter:

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
In this code, T is the stand-in type. It’s a placeholder that you can think of as a type that a developer will define later.
```

##  Using collection literals
```dart
List, set, and map literals can be parameterized. Parameterized literals are just like the literals you’ve already seen, except that you add <type> (for lists and sets) or <keyType, valueType> (for maps) before the opening bracket. Here is an example of using typed literals:

var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};
```

##  Using parameterized types with 
```dart
To specify one or more types when using a constructor, put the types in angle brackets (<...>) just after the class name. For example:

var nameSet = Set<String>.from(names);
The following code creates a map that has integer keys and values of type View:

var views = Map<int, View>();
```


##  Generic collections and the types they 
```dart
Dart generic types are reified, which means that they carry their type information around at runtime. For example, you can test the type of a collection:

var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
print(names is List<String>); // true
 Note: In contrast, generics in Java use erasure, which means that generic type parameters are removed at runtime. In Java, you can test whether an object is a List, but you can’t test whether it’s a List<String>.
```

##  Restricting the parameterized type
```dart
When implementing a generic type, you might want to limit the types that can be provided as arguments, so that the argument must be a subtype of a particular type. You can do this using extends.

A common use case is ensuring that a type is non-nullable by making it a subtype of Object (instead of the default, Object?).

class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}
You can use extends with other types besides Object. Here’s an example of extending SomeBaseClass, so that members of SomeBaseClass can be called on objects of type T:

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {...}
It’s OK to use SomeBaseClass or any of its subtypes as the generic argument:

var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
It’s also OK to specify no generic argument:

var foo = Foo();
print(foo); // Instance of 'Foo<SomeBaseClass>'
Specifying any non-SomeBaseClass type results in an error:

var foo = Foo<Object>();
```

##  Using generic methods
```dart
Initially, Dart’s generic support was limited to classes. A newer syntax, called generic methods, allows type arguments on methods and functions:

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
Here the generic type parameter on first (<T>) allows you to use the type argument T in several places:

In the function’s return type (T).
In the type of an argument (List<T>).
In the type of a local variable (T tmp).
```

##  Libraries and visibility
```dart
The import and library directives can help you create a modular and shareable code base. Libraries not only provide APIs, but are a unit of privacy: identifiers that start with an underscore (_) are visible only inside the library. Every Dart app is a library, even if it doesn’t use a library directive.

Libraries can be distributed using packages.

 If you’re curious why Dart uses underscores instead of access modifier keywords like public or private, see SDK issue 33383.
```

##  Using libraries
```dart
Use import to specify how a namespace from one library is used in the scope of another library.

For example, Dart web apps generally use the dart:html library, which they can import like this:

import 'dart:html';
The only required argument to import is a URI specifying the library. For built-in libraries, the URI has the special dart: scheme. For other libraries, you can use a file system path or the package: scheme. The package: scheme specifies libraries provided by a package manager such as the pub tool. For example:

import 'package:test/test.dart';
 Note: URI stands for uniform resource identifier. URLs (uniform resource locators) are a common kind of URI.

Specifying a library prefix
If you import two libraries that have conflicting identifiers, then you can specify a prefix for one or both libraries. For example, if library1 and library2 both have an Element class, then you might have code like this:

import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();
Importing only part of a library
If you want to use only part of a library, you can selectively import the library. For example:

// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;

Lazily loading a library
Deferred loading (also called lazy loading) allows a web app to load a library on demand, if and when the library is needed. Here are some cases when you might use deferred loading:

To reduce a web app’s initial startup time.
To perform A/B testing—trying out alternative implementations of an algorithm, for example.
To load rarely used functionality, such as optional screens and dialogs.
 Only dart2js supports deferred loading. Flutter, the Dart VM, and dartdevc don’t support deferred loading. For more information, see issue #33118 and issue #27776.

To lazily load a library, you must first import it using deferred as.

import 'package:greetings/hello.dart' deferred as hello;
When you need the library, invoke loadLibrary() using the library’s identifier.

Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
In the preceding code, the await keyword pauses execution until the library is loaded. For more information about async and await, see asynchrony support.

You can invoke loadLibrary() multiple times on a library without problems. The library is loaded only once.

Keep in mind the following when you use deferred loading:

A deferred library’s constants aren’t constants in the importing file. Remember, these constants don’t exist until the deferred library is loaded.
You can’t use types from a deferred library in the importing file. Instead, consider moving interface types to a library imported by both the deferred library and the importing file.
Dart implicitly inserts loadLibrary() into the namespace that you define using deferred as namespace. The loadLibrary() function returns a Future.
```

##  Implementing libraries
```dart
See Create Library Packages for advice on how to implement a library package, including:

How to organize library source code.
How to use the export directive.
When to use the part directive.
When to use the library directive.
How to use conditional imports and exports to implement a library that supports multiple platforms.
```

##  Asynchrony support
```dart
Dart libraries are full of functions that return Future or Stream objects. These functions are asynchronous: they return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete.

The async and await keywords support asynchronous programming, letting you write asynchronous code that looks similar to synchronous code.
```

##  Handling Futures
```dart
When you need the result of a completed Future, you have two options:

Use async and await, as described here and in the asynchronous programming codelab.
Use the Future API, as described in the library tour.
Code that uses async and await is asynchronous, but it looks a lot like synchronous code. For example, here’s some code that uses await to wait for the result of an asynchronous function:

await lookUpVersion();
To use await, code must be in an async function—a function marked as async:

Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
 Note: Although an async function might perform time-consuming operations, it doesn’t wait for those operations. Instead, the async function executes only until it encounters its first await expression (details). Then it returns a Future object, resuming execution only after the await expression completes.

Use try, catch, and finally to handle errors and cleanup in code that uses await:

try {
  version = await lookUpVersion();
} catch (e) {
  // React to inability to look up the version
}
You can use await multiple times in an async function. For example, the following code waits three times for the results of functions:

var entrypoint = await findEntryPoint();
var exitCode = await runExecutable(entrypoint, args);
await flushThenExit(exitCode);
In await expression, the value of expression is usually a Future; if it isn’t, then the value is automatically wrapped in a Future. This Future object indicates a promise to return an object. The value of await expression is that returned object. The await expression makes execution pause until that object is available.

If you get a compile-time error when using await, make sure await is in an async function. For example, to use await in your app’s main() function, the body of main() must be marked as async:

void main() async {
  checkVersion();
  print('In main: version is ${await lookUpVersion()}');
}
 Note: The preceding example uses an async function (checkVersion()) without waiting for a result—a practice that can cause problems if the code assumes that the function has finished executing. To avoid this problem, use the unawaited_futures linter rule.

For an interactive introduction to using futures, async, and await, see the asynchronous programming codelab.
```

##  Declaring async functions
```dart
An async function is a function whose body is marked with the async modifier.

Adding the async keyword to a function makes it return a Future. For example, consider this synchronous function, which returns a String:

String lookUpVersion() => '1.0.0';
If you change it to be an async function—for example, because a future implementation will be time consuming—the returned value is a Future:

Future<String> lookUpVersion() async => '1.0.0';
Note that the function’s body doesn’t need to use the Future API. Dart creates the Future object if necessary. If your function doesn’t return a useful value, make its return type Future<void>.

For an interactive introduction to using futures, async, and await, see the asynchronous programming codelab.
```

##  Handling Streams
```dart
When you need to get values from a Stream, you have two options:

Use async and an asynchronous for loop (await for).
Use the Stream API, as described in the library tour.
 Note: Before using await for, be sure that it makes the code clearer and that you really do want to wait for all of the stream’s results. For example, you usually should not use await for for UI event listeners, because UI frameworks send endless streams of events.

An asynchronous for loop has the following form:

await for (varOrType identifier in expression) {
  // Executes each time the stream emits a value.
}
The value of expression must have type Stream. Execution proceeds as follows:

Wait until the stream emits a value.
Execute the body of the for loop, with the variable set to that emitted value.
Repeat 1 and 2 until the stream is closed.
To stop listening to the stream, you can use a break or return statement, which breaks out of the for loop and unsubscribes from the stream.

If you get a compile-time error when implementing an asynchronous for loop, make sure the await for is in an async function. For example, to use an asynchronous for loop in your app’s main() function, the body of main() must be marked as async:

void main() async {
  // ...
  await for (final request in requestServer) {
    handleRequest(request);
  }
  // ...
}
For more information about asynchronous programming, in general, see the dart:async section of the library tour.
```

##  Generators
```dart
When you need to lazily produce a sequence of values, consider using a generator function. Dart has built-in support for two kinds of generator functions:

Synchronous generator: Returns an Iterable object.
Asynchronous generator: Returns a Stream object.
To implement a synchronous generator function, mark the function body as sync*, and use yield statements to deliver values:

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
To implement an asynchronous generator function, mark the function body as async*, and use yield statements to deliver values:

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
If your generator is recursive, you can improve its performance by using yield*:

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
```

##  Callable classes
```dart
To allow an instance of your Dart class to be called like a function, implement the call() method.

In the following example, the WannabeFunction class defines a call() function that takes three strings and concatenates them, separating each with a space, and appending an exclamation. Click Run to execute the code.


class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

void main() => print(out);


```

##  Isolates
```dart
Most computers, even on mobile platforms, have multi-core CPUs. To take advantage of all those cores, developers traditionally use shared-memory threads running concurrently. However, shared-state concurrency is error prone and can lead to complicated code.

Instead of threads, all Dart code runs inside of isolates. Each Dart isolate has a single thread of execution and shares no mutable objects with other isolates.

For more information, see the following:

Concurrency in Dart
dart:isolate API reference, including Isolate.spawn() and TransferableTypedData
Background parsing cookbook on the Flutter site
Isolate sample app
```

##  Typedefs
```dart
A type alias—often called a typedef because it’s declared with the keyword typedef—is a concise way to refer to a type. Here’s an example of declaring and using a type alias named IntList:

typedef IntList = List<int>;
IntList il = [1, 2, 3];
A type alias can have type parameters:

typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Verbose.
ListMapper<String> m2 = {}; // Same thing but shorter and clearer.
 Version note: Before 2.13, typedefs were restricted to function types. Using the new typedefs requires a language version of at least 2.13.

We recommend using inline function types instead of typedefs for functions, in most situations. However, function typedefs can still be useful:

typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}
```

##  Metadata
```dart
Use metadata to give additional information about your code. A metadata annotation begins with the character @, followed by either a reference to a compile-time constant (such as deprecated) or a call to a constant constructor.

Three annotations are available to all Dart code: @Deprecated, @deprecated, and @override. For examples of using @override, see Extending a class. Here’s an example of using the @Deprecated annotation:

class Television {
  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {...}
  // ···
}
You can define your own metadata annotations. Here’s an example of defining a @Todo annotation that takes two arguments:

library todo;

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
And here’s an example of using that @Todo annotation:

import 'todo.dart';

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}
Metadata can appear before a library, class, typedef, type parameter, constructor, factory, function, field, parameter, or variable declaration and before an import or export directive. You can retrieve metadata at runtime using reflection.
```

##  Comments
```dart
Dart supports single-line comments, multi-line comments, and documentation comments.

Single-line comments
A single-line comment begins with //. Everything between // and the end of line is ignored by the Dart compiler.

void main() {
  // TODO: refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');
}
```

##  Single-line comments
```dart
A single-line comment begins with //. Everything between // and the end of line is ignored by the Dart compiler.

void main() {
  // TODO: refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');
}A multi-line comment begins with /* and ends with */. Everything between /* and */ is ignored by the Dart compiler (unless the comment is a documentation comment; see the next section). Multi-line comments can nest.

void main() {
  /*
   * This is a lot of work. Consider raising chickens.

  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
   */
}
```

##  Multi-line comments
```dart
A multi-line comment begins with /* and ends with */. Everything between /* and */ is ignored by the Dart compiler (unless the comment is a documentation comment; see the next section). Multi-line comments can nest.

void main() {
  /*
   * This is a lot of work. Consider raising chickens.

  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
   */
}
```

##  Documentation comments
```dart
Documentation comments are multi-line or single-line comments that begin with /// or /**. Using /// on consecutive lines has the same effect as a multi-line doc comment.

Inside a documentation comment, the analyzer ignores all text unless it is enclosed in brackets. Using brackets, you can refer to classes, methods, fields, top-level variables, functions, and parameters. The names in brackets are resolved in the lexical scope of the documented program element.

Here is an example of documentation comments with references to other classes and arguments:

/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  /// The typical llama eats one bale of hay per week.
  void feed(Food food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}
In the class’s generated documentation, [feed] becomes a link to the docs for the feed method, and [Food] becomes a link to the docs for the Food class.

To parse Dart code and generate HTML documentation, you can use Dart’s documentation generation tool, dart doc. For an example of generated documentation, see the Dart API documentation. For advice on how to structure your comments, see Effective Dart: Documentation.
```


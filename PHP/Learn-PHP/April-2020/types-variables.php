<?php

/*************************************
 *   Types & Variables
 */

// Boolean values are case-insensitive
$boolean = true;
$boolean_second = false;

echo "Show Boolean Variables Values: \n";
echo $boolean, "\n"; // = 1 (means true)
echo $boolean_second, "\n"; // = nothing!

// Integers
$int1 = 12; // => 12
$int2 = -12; // => -12
$int3 = 012; // => 10 (octal number)
$int4 = 0x0F; // => 15 (a leading 0x denotes a hex liteal)
$int5 = 0b11111111; // => 255 (a leading 0b denotes a binary)

echo "Show Integers Variables Values: \n";
echo "Int 1: ", $int1, "\n";
echo "Int 2: ", $int2, "\n";
echo "Int 3: ", $int3, "\n";
echo "Int 4: ", $int4, "\n";
echo "Int 5: ", $int5, "\n";

// Floats (aka doubles)
$float = 1.234;
$float = 1.2e3;
$float = 7E-10;

echo "Show Float Variables Values: \n";
echo "Float: ", $float, "\n";

// Delete variable
unset($int1);

echo "Type to deleted variable like (\$int1): \n";
echo $int1, "\n"; // nothing!

// Arithmetic
$sum = 1 + 1;
$difference = 2 - 1;
$product = 2 * 2;
$quotient = 2 / 1;

echo "Show Arithemetic Values: \n";
echo "Sum example result: ", $sum, "\n";
echo "Difference example result: ", $difference, "\n";
echo "Product example result: ", $product, "\n";
echo "Quotient example result: ", $quotient, "\n";


// Shorthand
$number = 0;
$number += 1; // Increment $number by 1
echo $number++, "\n"; // Prints 1 (increments after evaluation)
echo ++$number, "\n"; // Prints 3 (increments before evaluation)
$number /= $float; // Divide and assign the quotient to $number

// String should be enclosed in single qoutes;
$sgl_quotes = '$String'; // => '$String'
echo $sgl_quotes, "\n";

// Avoid using double qoutes except to embed other variables
$dbl_quotes = "This is a $sgl_quotes."; // => 'This is a $String.'
echo $dbl_quotes, "\n";

// Special characters are only escaped in double quotes
$escaped = "This contains a \t tab character.";
$unescaped = 'This just contains a slash and a t: \t';

echo $escaped, "\n";
echo $unescaped, "\n";

// Enclose a variable in curly braces if needed
$apples = "I have {$number} apples to eat.";
$oranges = "I have ${number} oranges to eat.";
$money = "I have $${number} in the bank.";

echo $apples, "\n", $oranges, "\n", $money, "\n";

// Since PHP 5.3, nowdocs can be used for uniterpolated multi-liners
$nowdoc = <<<'END'
Multi line
string
END;
echo "Multiline: \n";
echo $nowdoc, "\n\n";

// Heredocs will do string interpolation
$heredoc = <<<END
Multi line
$sgl_quotes
END;

// String concatenation is done with.
echo 'This string ' . 'is concatenated';

echo "\n";

// Strings can be passed in as parameters to echo
echo 'Multiple', 'Parameters', 'Valid'; // Returns 'MultipleParametersValid'

echo "\n";

?>

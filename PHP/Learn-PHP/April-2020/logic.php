<?php

/*******************************
 * Logic
 */
 
$a = 0;
$b = '0';
$c = '1';
$d = '1';

// assert throws a warning if its argument is not true

/*
// These comparisons will always be true, even if the types aren't the same.
echo assert($a == $b) . "\n"; // equality
echo assert($c != $a) . "\n"; // inequality
echo assert($c <> $a) . "\n"; // alternative inequality
echo assert($a < $c) . "\n";
echo assert($c > $b) . "\n";
echo assert($a <= $b) . "\n";
echo assert($c >= $d) . "\n";
*/
echo "Compare the numbers:" . "\n";

$a = 100;
$b = 10000;
echo ($a <=> $a) . "\n";
echo ($a <=> $b) . "\n";
echo ($b <=> $a) . "\n";

// Variables can be converted between types, depending on their usage.

$integer = '1';
echo $integer + $integer; // => 2 (string are coerced to integers

$string = 'one';
echo $string + $string . "\n"; // => 0
// Outputs 0 because the + operator cannot cast the string 'one' to a number

$boolean = (boolean) 1;
echo $boolean . "\n";

$zero = 0;
$boolean = (boolean) $zero; // => false
echo $boolean;

// There are also dedicated functions for casting most types
$integer = 5;
$string = strval($integer);
echo $string . "\n";

$val = null; // Null value
echo $val;

echo "\n";
?>
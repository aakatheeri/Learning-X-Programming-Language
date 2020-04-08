<?php

// A constant is defined by using define()
// and can never be changed during runtime!

// a valid constant name starts with a letter or underscore,
// followed by any number of letters, numbers, or underscores.
define("FOO", "something");

// access to a constant is possible by calling the chosen name without a $
echo FOO, "\n"; // Returns 'something'
echo 'This outputs ' . FOO . "\n"; // Returns 'This outputs something'

// Define constant using 'const' datatype
const HEIGHT = 173;
const WEIGHT = 75;

echo "Height is " . HEIGHT . " and Weight is " . WEIGHT;
echo "\n";

// check if HEIGHT is defined or not
defined('HEIGHT') ? 
     print("Height is defined! \n")
      : print("Height is not defined! \n");
 
?>
<?php

/*******************************
 * Arrays
 */

// All arrays in PHP are associative arrays (hashmaps in some languages)

// Works with all PHP versions
$associative = array('One' => 1, 'Two' => 2, 'Three' => 3);

// PHP 5.4 introduced a new syntax
$associative = ['One' => 1, 'Two' => 2, 'Three' => 3];

echo $associative['One'] . "\n"; // prints 1

// Add an element to an associative array
$associative['Four'] = 4;

// List literals implicitly assign integer keys
$array = ['One', 'Two', 'Three'];
echo $array[0] . "\n";

// Add an element to the end of an array
$array[] = 'Four';

// Display last item on $array
echo $array[sizeof($array)-1] . "\n";

// Another way to add element to array
array_push($array, 'Five');

// Remove element from array
unset($array[3]);


?>

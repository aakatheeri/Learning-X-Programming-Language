<?php

/***************************
 * Output
 */
 
echo('Hello World') . "\n";
// Prints Hello World! to stdout
// Stdout is the web page if running in a browser

print('Hello World!') . "\n"; // The same sa echo

// echo and print are language constructs too, so you can drop the parentheses
echo 'Hello World!' . "\n";
print 'Hello World!' . "\n";

$paragraph = 'paragraph';

echo 100 . "\n";
echo $paragraph . "\n";

// If short open tags are configured, or your PHP version is
// 5.4.0 or greater, you can sue the short echo syntac
?>

<p><?= $paragraph ?></p>

<?php

$x = 1;
$y = 2;
$x = $y; // $x now contains the same value as $y
$z = &$y;
// $z now contains a reference to $y. Changing the value of
// $z will change the value of $y also, and vice-verca.
// $x will remain unchanged as the original value of $y

// Dumps type and value of variable to stdout
var_dump($z);

// Prints variable to stdout in human-radable format

$array = ['One', 'Two', 'Three'];
print_r($array); // prints: Array ( [0] => One [1] => Two [2] => Three )


?>
<?php

/**********************************
*    Magic constants
*
*/

// Get current class name. Must be used inside a class delaration.
class Person {
     public function __construct() {
          echo "Current class name is \"" . __CLASS__ . "\"\n";
     }
}
$ahmed = new Person();

// Get full path directory is of a file
echo "Current directory is => " . __DIR__ . "\n";

// Get full path of a file
echo "Current file path is => " . __FILE__ . "\n";

// Get current line number
echo "Current line number is => " . __LINE__ . "\n";

// Get the name of the current method. Pnly returns a value when used inside a trait or object declaration.
// echo "Current method is " . __METHOD__ . "\n";

// Get the name of the current namespace
// echo "Current namespace is " . __NAMESPACE__ . "\n";

// Get the name of the current trait. Only returns a value when used inside a trait or object declaration.
// echo "Current trait is " . __TRAIT__ . "\n";

?>

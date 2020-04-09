<?php

/*************************************
 * Traits
 */
 
// Traits are available from PHP 5.4.0 and are declared using "trait"

trait MyTrait {
     public function myTraitMethod() {
          print 'I have MyTrait' . "\n";
     }
}

class MyTraitfulClass {
     use MyTrait;
}

$cls = new MyTraitfulClass();
$cls->myTraitMethod(); // Prints "I have MyTrait"


?>
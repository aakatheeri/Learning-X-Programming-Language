<?php

/*********************************
 * Classes
 */

// Classes are defined with the class keyword

class MyClass {

     const MY_CONST = 'value'; // A constant
     
     static $staticVar = 'static';
     
     // Static variables and their visibility
     public static $publicStaticVar = 'publicStatic';
     
     // Accessible within the class only
     private static $privateStaticVar = 'privateStatic';
     
     // Accessible from the class and subclasses
     protected static $protectedStaticVar = 'protectedStatic';
     
     // Properties must declare their visibility
     public $property = 'public';
     public $instanceProp;
     protected $prot = 'protected'; // Accessible from the class and subclasses
     private $priv = 'private'; // Accessible within the class only
     
     // Create a constructor with __construct
     public function __construct($instanceProp) {
          // Acess instance variables with $this
          $this->instanceProp = $instanceProp;
     }
     
     // Methods are declared as functions inside a class
     public function myMethod() {
          print 'MyClass';
     }
     
     // final keyword would make a function unoverridable
     final function youCannotOverrideMe() {
          
     }
     
     // Margic Methods
     
     // what to do if Object is treated as a String
     public function __toString() {
          return $property;
     }
     
     // opposite to __construct()
     // called when object is no longer referenced
     public function __destruct() {
          print "Destroying";
          echo "\n";
     }
     
     /*
          Declaring class properties or methods as
           static makes them accessible without
           needing an instatiation of the class. 
           A property declared as static can not
           be accessed with an instantiated class object 
               (through a static method can).
     */
     
     public static function myStaticMethod() {
          print 'I am static';
     }
}

// Class constants can always be accessed statically
echo MyClass::MY_CONST; // Outputs 'value';
echo "\n";

echo MyClass::$staticVar; // Outputs 'static';
echo "\n";

MyClass::myStaticMethod(); // Outputs 'I am static';
echo "\n";

// Instantiate classes using new
$my_class = new MyClass('An instance property');
// The parentheses are optional if not passing in an argument.

// Access class members using ->
echo $my_class->property;     // => "public"
echo "\n";

echo $my_class->instanceProp;  // => "An instance property"
echo "\n";

$my_class->myMethod();        // => "MyClass"
echo "\n";

// Extend classes using "extends"
class MyOtherClass extends MyClass {
     function printProtectedProperty() {
          echo $this->prot;
     }
     
     // Override a method
     function myMethod() {
          parent::myMethod();
          print ' > MyOtherClass';
     }
}

$my_other_class = new MyOtherClass('Instance prop');
$my_other_class->printProtectedProperty(); // => Prints "protected"
echo "\n";

$my_other_class->myMethod(); // => Prints "MyClass > MyOtherClass"
echo "\n";

final class YouCannotExtendMe {
     
}

// You can use "magic methods" to create getters and setters
class MyMapClass {
     private $property;
     
     public function __get($key) {
          return $this->$key;
     }
     
     public function __set($key, $value) {
          $this->$key = $value;
     }
}

$x = new MyMapClass();
echo $x->property; // Will use the __get() method
$x->property = 'Something'; // Will use the __set() method

// Classes can be abstract (using the abstract keyword) or
// Implement interfaces (using the implements keyword).
// An interface is declared with the interface keyword.

interface InterfaceOne {
     public function doSomething();
}

interface InterfaceTwo {
     public function doSomethingElse();
}

// interfaces can be extended
interface InterfaceThree extends InterfaceTwo {
     public function doAnotherContract();
}

abstract class MyAbstractClass implements InterfaceOne {
     public $x = 'doSomething';
}

class MyConcreteClass extends MyAbstractClass implements InterfaceTwo {
     public function doSomething() {
          echo $x . "\n";
     }
     
     public function doSomethingElse() {
          echo 'doSomethingElse' . "\n";
     }
}

// Classes can implement more than one interface
class SomeOtherClass implements InterfaceOne, InterfaceTwo {
     public function doSomething() {
          echo 'doSomething' . "\n";
     }
     
     public function doSomethingElse() {
          echo 'doSomethingElse' . "\n";
     }
}

SomeOtherClass::doSomething();

?>
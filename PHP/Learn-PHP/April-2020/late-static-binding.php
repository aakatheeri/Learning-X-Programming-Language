<?php

/********************************
 * Late Static Binding
 */

class ParentClass {
     public static function who() {
          echo "I'm a " . __CLASS__ . "\n";
     }

     public static function test() {
          // self references the class the method is defined within
          self::who();
          // static references the class the method was invoked
          static::who();
     }
}

ParentClass::test();
     /*
     I'm a ParentClass
     I'm a ParentClass
     */

class ChildClass extends ParentClass {
     public static function who() {
          echo "But I'm " . __CLASS__ . "\n";
     }
}

ChildClass::test();
     /*
     I'm a ParentClass
     But I'm ChildClass
     */



?>

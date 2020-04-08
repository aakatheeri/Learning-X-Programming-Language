<?php

/***************************
 * Control Structure
 */

if (true) {
     print 'I get printed';
     print "\n";
}

if (false) {
     print 'I don\'t';
     print "\n";
} else {
     print 'I get printed';
     print "\n";
}

// ternary operator
print (false ? 'Does not get printed' : 'Does');
print "\n";

// ternary shortcut operator since PHP 5.3
// equivalent of "$x ? $x : 'Does'"
$x = false;
print($x ?: 'Does'); // if 'false', then keep it false, otherwise make it true

print "\n";
$x = 0;
if ($x === '0') {
     print 'Does not print';
} else if ($x == '1') {
     print 'Does not print';
} else {
     print 'Does print';
}

print "\n";

// Use switch to same some logic
switch ($x) {
     case '0':
          print 'Switch does type coercion';
          break;
     case 'two':
     case 'three':
          // Do something if $variable is either 'two' or 'three'
          break;
     default:
          // do something by default
}

echo "\n";

// While, do .... while and for loops are probably familiar
$i = 0;
while ($i < 5) {
     if ($i == 4) {
          echo $i;
     } else {
          echo $i . ", ";
     }
     ++$i;
}

echo "\n";

$i = 0;

do {
     echo $i++;
} while ($i < 5);

echo "\n";

for ($x = 0; $x < 10; $x++) {
     echo $x;
}

echo "\n";

$wheels = ['bicycle' => 2, 'car' => 4];

// Foreach loops can iterate over arrays
foreach ($wheels as $wheel_count) {
     echo $wheel_count;
} // prints "24"

echo "\n";

// You can iterate over the keys as well as the values
foreach ($wheels as $vehicle => $wheel_count) {
     echo "A $vehicle has $wheel_count wheels";
}

echo "\n";

$i = 0;
while ($i < 5) {
     if ($i === 3) {
          break; // Exit out of the while loop
     }
     echo $i++;
} // Print "012"

echo "\n";

for ($i = 0; $i < 5; $i++) {
     if ($i === 3) {
          continue; // Skip this iteration of the loop
     }
     echo $i;
}

echo "\n";
?>

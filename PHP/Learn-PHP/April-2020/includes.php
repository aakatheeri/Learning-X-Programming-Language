<?php

/*********************************
 * Includes
 */

// PHP wthin included files must also begin with a PHP open tag

const FILES_PATH = 'other-files/';

include FILES_PATH . 'my-file.php';

// The code in my-file is now available in the current scope
// If the file cannot be included (e.g. file not found), a warning is emitted.

include_once FILES_PATH . 'my-file.php';
//include_once('other-files/my-file.php');

// If the code in my-file.php has been included elsewhere, it will
//   not be included again. This prevernts multiple class declaration errors

require FILES_PATH . 'another-file.php';
require_once FILES_PATH . 'another-file.php';

// Same as include(), except require will
//   cause a fatal error if the file can
//   not be included.

?>

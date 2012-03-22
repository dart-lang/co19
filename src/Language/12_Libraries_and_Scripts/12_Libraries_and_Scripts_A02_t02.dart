/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryDefinition:
 * scriptTag:
 * `#!' (~NEWLINE)* NEWLINE
 * ;
 * A library may optionally begin with a script tag, which can be used to
 * identify the interpreter of the script to whatever computing environment the
 * script is embedded in. A script tag begins with the characters #! and ends at the
 * end of the line. Any characters after #! are ignored by the Dart implementation.
 * @description Checks that a script tag must be begins with the characters #!.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A02_t02_lib.dart");

main() {
  try {
    var someVar = null;
  } catch(var e) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 * scriptTag? libraryName? import* include* resource* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-time error when a resource directive
 * comes before the library name.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#! scripts tag
#resource('favicon.ico'); // error
#library("Script_A01_t08");

main() {
  try {
    var forSomeCode = 0;
  } catch(var e) {}
}

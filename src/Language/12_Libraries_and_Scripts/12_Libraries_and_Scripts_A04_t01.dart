/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryDefinition:
 *   scriptTag? libraryName import* include* resource* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-time error if the same library name
 * is declared twice.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A04_t01_lib.dart");

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}

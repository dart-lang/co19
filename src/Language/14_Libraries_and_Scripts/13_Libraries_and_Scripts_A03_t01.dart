/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryName:
 *    metadata library identifier (‘.’ identifier)* ‘;’
 * ;
 * An explicitly named library begins with the word library (possibly prefaced
 * with any applicable metadata annotations), followed by a qualified identifier
 * that gives the name of the library.
 * @description Checks that valid library directives (according to the spec)
 * do not cause compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

import "13_Libraries_and_Scripts_A03_t01_p1.dart" as lib1;
import "13_Libraries_and_Scripts_A03_t01_p2.dart" as lib2;
import "13_Libraries_and_Scripts_A03_t01_p3.dart" as lib3;
import "13_Libraries_and_Scripts_A03_t01_p4.dart" as lib4;
import "13_Libraries_and_Scripts_A03_t01_p5.dart" as lib5;
import "13_Libraries_and_Scripts_A03_t01_p6.dart" as lib6;

main() {
  lib1.foo;
  lib2.foo;
  lib3.foo;
  lib4.foo;
  lib5.foo;
  lib6.foo;
}

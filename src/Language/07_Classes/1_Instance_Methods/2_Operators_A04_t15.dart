/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the number of formal parameters 
 * of the user-declared operator with one of the names: 
 * equals, <, >, <=, >=, -, +, ~/, /, *, %, |, ^, &, <<, >>, >>>, [] is not 1.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator [] specifies two parameters.
 * @compile-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class C {
  operator [](var index, var val) {}
}

main() {
  try {
    bool b = (new C()[1]);
  } catch(var ex) {}
}


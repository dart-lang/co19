/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if T1 does not denote a type available 
 * in the lexical scope of the catch clause.
 * @description Checks that it is a compile-time error when type of an exception
 * parameter in a catch clause does not denote a type available in the lexical 
 * scope of the catch clause.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  try {
    throw "foo";
    Expect.fail("This code shouldn't be executed");
  } on Unavailable catch(ex) {
    Expect.fail("This code shouldn't be executed");
  }
}

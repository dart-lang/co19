/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An on-catch clause of the form on T catch (p1) s is equivalent to
 * an on-catch clause on T catch (p1, p2) s where p2 is an identiier that does
 * not occur anywhere else in the program.
 * @description Checks that a catch clause with an explicitly specified type T
 * of the first exception parameter does not match a thrown object if it's not
 * null and its type is not a subtype of T.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class A {}
class B extends A {}

main() {
  try {
    try {
      throw new A();
    } on B catch (ex) {
      Expect.fail("This clause shouldn't be executed");
    } on String catch (ex) {
      Expect.fail("This clause shouldn't be executed");
    } on int catch (ex) {
      Expect.fail("This clause shouldn't be executed");
    }
  } on A catch (ok) {}
}

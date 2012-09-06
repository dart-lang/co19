/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A catch clause of one of the forms on T1 catch(p1) s, catch (T1 p1, T2 p2) s, catch (T1 p1,
 * final p2) s, catch (T1 p1, final T2 p2) s, catch (T1 p1, var p2) s, catch ( final T1
 * p1, T2 p2) s, catch ( final T1 p1, final p2) s, catch ( final T1 p1, final T2 p2) s
 * or catch ( final T1 p1, var p2) s matches an object o if the type of o is a subtype of T1.
 * @description Checks that a catch clause with an explicitly specified type T of the first
 * exception parameter does not match a thrown object if it's not null and its type is not a subtype of T. 
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class A {}
class B extends A {}

main() {
  try {
    try {
      throw new A();
    } on B catch(ex) {
      Expect.fail("This clause shouldn't be executed");
    } on String catch(ex) {
      Expect.fail("This clause shouldn't be executed");
    } on int catch(ex) {
      Expect.fail("This clause shouldn't be executed");
    }
  } on A catch(ok) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A catch clause of one of the forms catch (T1 p1, T2 p2) s, catch (T1 p1,
 * final p2) s, catch (T1 p1, final T2 p2) s, catch (T1 p1, var p2) s, catch ( final T1
 * p1, T2 p2) s, catch ( final T1 p1, final p2) s, catch ( final T1 p1, final T2 p2) s
 * or catch ( final T1 p1, var p2) s matches an object o if o is null or if the type
 * of o is a subtype of T1.
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
    } catch(B ex) {
      Expect.fail("This clause shouldn't be executed");
    } catch(String ex) {
      Expect.fail("This clause shouldn't be executed");
    } catch(int ex) {
      Expect.fail("This clause shouldn't be executed");
    }
  } catch(A ok) {}
}

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
 * @description Checks that it is fine to put first the most common catch clause and that
 * an exception can not be caught with unmatching clauses.
 * @author iefremov
 */

class A {}
class B extends A {}
class C extends B {}

main() {
  try {
    try {
      throw new Object();
    } catch(A ex) {
      Expect.fail("This clause shouldn't be executed");
    } catch(B ex) {
      Expect.fail("This clause shouldn't be executed");
    } catch(C ex) {
      Expect.fail("This clause shouldn't be executed");
    }
  } catch(Object o) {}
}

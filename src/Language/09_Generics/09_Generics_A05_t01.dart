/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to refer to a type parameter from within a static member.
 * @description Checks that it is a type error in both modes to reference a type parameter in a type test 
 * expression from static context.
 * @author iefremov
 * @needsreview Assertion obsolete, update once spec v0.12 is out (see issue 5230)
 */

class C<T> {
  static f() {
    null is T;
  }
}

main() {
  try {
    C.f();
    Expect.fail("TypeError expected");
  } on TypeError catch(ok) {
  }
}

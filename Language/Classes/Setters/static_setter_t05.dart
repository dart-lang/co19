/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if a class declares a static setter
 * named v= and also has a non-static member named v.
 * @description Checks that it is a compile error if a class declares a
 * static setter named v= and also has a non-static inherited method named v.
 * @compile-error
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

class A {
  void foo() {}
}

class C extends A {
  static String foo2 = "foo";

  static set foo(String s) {
    foo2 = s;
  }

}

main() {
  C.foo = "foo";
  Expect.equals(C.foo2, "foo");
}

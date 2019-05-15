/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if a getter m1 overrides a getter m2 and
 * the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced when the return type
 * of m1 is void and the return type of m2 is String.
 * @compile-error
 * @author vasya
 */

class A {
  String get foo { return "foo"; }
}

class C extends A {
  void get foo {
  }
}

main() {
  new C().foo;
}

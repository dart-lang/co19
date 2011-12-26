/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a getter m1 overrides (7.8.1) a getter 
 * or method m2 and the type of m1 is not a subtype of the type of m2. 
 * @description Checks that a static warning is produced when the return type of m1
 * is void and the return type of m2 is String.
 * @static-type-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  String get foo() { return "foo"; }
}

class C extends A {
  void get foo() { }
}

main() {
  new C().foo;
}

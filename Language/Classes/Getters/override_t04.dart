/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if a getter m1 overrides a getter m2 and
 * the type of m1 is not a subtype of the type of m2.
 * @description Checks that there are no compile error or warnings when type of
 * m1 is in fact a subtype of type of m2
 * @static-clean
 * @author ilya
 */

class Super {}
class Sub extends Super {}

class A {
  num get getter1 => 0;
  Super get getter2 => null;
  Super get getter3 => null;
  Object get getter4 => new Object();
}

class C extends A {
  int get getter1 => 1;
  Super get getter2 => null;
  Sub get getter3 => null;
  Super get getter4 => new Super();
}

main() {
  new A();
  new C();
}

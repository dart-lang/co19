/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class C is a superclass of itself.
 * @description Checks that it is a compile-time error if a class attempts to
 * extend itself indirectly, by transition.
 * @compile-error
 * @author msyabro
 */

class A extends D {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  try {
    new A();
  } catch (e) {}
}

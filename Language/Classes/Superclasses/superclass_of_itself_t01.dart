/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class C is a superclass of itself.
 * @description Checks that it is a compile-time error if a class references
 * itself in its extends clause.
 * @compile-error
 * @author pagolubev
 */

class A extends A {}

main() {
  try {
    new A();
  } catch (e) {}
}

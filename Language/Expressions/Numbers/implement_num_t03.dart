/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for any type other than the types
 * int and double to attempt to extend, mix in or implement num.
 * @description Checks that a user-defined interface can not extend num.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

abstract class A extends num {}

class B implements A {}

main() {
  try {
    new B();
  } catch (x) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for a class to attempt to extend,
 * mix in or implement bool.
 * @description Checks that it is a compile-time error when a user-defined
 * interface attempts to extend bool.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

abstract class I extends bool {}
class C implements I {}

main() {
  try {
    new C();
  } catch (e) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extends clause of an interface includes type Dynamic.
 * @description Checks that it is a compile-time error if an interface attempts to extend Dynamic directly.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @needsreview issue 969
 */

interface I extends Dynamic {}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}


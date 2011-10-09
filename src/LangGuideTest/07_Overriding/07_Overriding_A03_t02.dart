/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a function or the overriden function is static.
 * @description Checks that it is an error if a function overrides static function.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  static void func() {}
}

class B extends A {
  void func() {}
}


void main() {}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an initializing formal is used by a
 * function other than a non-redirecting generative constructor.
 * @description Checks that it is a compile-time error when the initializing
 * formal syntax is used by an instance method (as an optional parameter).
 * @compile-error
 * @author rodionov
 */

class C {
  int x;
  foo([this.x]) {}
}

main() {
  try {
    (new C()).foo();
  } catch (v) {}
}

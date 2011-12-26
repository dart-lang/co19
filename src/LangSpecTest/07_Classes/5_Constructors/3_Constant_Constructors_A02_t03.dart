/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a constant constructor has a body.
 * @description Checks that it is a compile-time error if a named constant constructor has a body.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  const A.named() : x = 1 {}
  final x;
}

main() {
  try {
    A a = const A.named();
  } catch(var x) {}
}

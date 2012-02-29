/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if evaluation of a compile-time constant would raise
 * an exception.
 * @description Checks that a NoSuchMethodException raised during evaluation of a compile-time constant
 * causes a compile-time error.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

class A {
  const A(z) : x = z + z;
  final x;
}

final m = const A(const []);

main() {
  try {
    print(m);
  } catch(var x) {}
}

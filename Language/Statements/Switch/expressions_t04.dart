/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the values of the expressions ek
 * are not either:
 * • instances of the same class C, for all k in 1..n, or
 * • instances of a class that implements int, for all k in 1..n, or
 * • instances of a class that implements String, for all k in 1..n.
 * @description Checks that it is a compile-time error if case expressions
 * are instances of different user-defined classes.
 * @compile-error
 * @author ilya
 */

class C {
  final id;
  const C(this.id);
}

class D {
  final id;
  const D(this.id);
}

main() {
  var x = const C(0);
  try {
    switch (x) {
      case const C(1):
      case const C(2):
      case const D(1):
    }
  } catch (e) {}
}

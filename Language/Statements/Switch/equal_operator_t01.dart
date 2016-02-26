/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the class C has an implementation
 * of the operator == other than the one inherited from Object unless the
 * value of the expression is a string, an integer, literal symbol or the result
 * of invoking a constant constructor of class Symbol.
 * @description Checks that it is a compile-time error if class C implements
 * operator ==.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

class C {
  final int x;
  const C(this.x);
  bool operator ==(C other) {
    return this.x == other.x;
  }
}

main() {
  const C c1 = const C(1), c2 = const C(2);
  var x = c2;
  var y;

  switch (x) {
    case c1:
      y = 1;
      break;
    case c2:
      y = 2;
      break;
  }
}

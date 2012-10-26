/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the class C implements the operator ==.
 * @description Checks that it is a compile-time error if the class C implements
 * the operator ==.
 * @compile-error
 * @author kaigorodov
 */

class C {
  final int x;
  const C(this.x);
  bool operator == (C other) {
    return this.x == other.x;
  }
}
}

main() {
  const C c1=const C(1), c2=const C(2);
  var x = c2;
  var y;
  
    switch(x) {
      case c1:
        y=1;
      case c2:
        y=2;
    }
}

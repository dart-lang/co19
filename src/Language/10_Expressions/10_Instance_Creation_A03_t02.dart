/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a
 * constructor of a non-generic type invoked by a new expression or a constant
 * object expression is passed any type arguments.
 * @description Checks that it is a compile-time error if a constructor of
 * a non-generic type invoked by a constant object expression is passed any type arguments.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {
  const A();
}

main() {
  try {
    var o = const A<int>();
  } catch(var e) {}
}

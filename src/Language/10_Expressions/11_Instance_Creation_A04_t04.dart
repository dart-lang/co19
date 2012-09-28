/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a constructor of a generic type
 * with n type parameters invoked by a new expression or a constant object
 * expression is passed m type arguments where m != n.
 * @description Checks that it is a compile-time error if  a constructor of a generic type
 * with n type parameters invoked by a constant object expression is passed m type arguments where m < n.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class A<T, U, V> {
  const A();
}

main() {
  try {
    var o = const A<Dynamic>();
  } catch(e) {}
}

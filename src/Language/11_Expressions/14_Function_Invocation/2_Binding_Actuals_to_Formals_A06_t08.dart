/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Ti be the static type of ai, let Si be the type of pi, i from 1 to n + k and let
 * Sq be the type of the named parameter q of f. It is a static warning if m < n or if m > n + k.
 * @description Checks that it is a static warning if more actual arguments than there're formal
 * parameters are provided to a static method invocation.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  static func(p1, p2, [p3]) {}
}

main() {
  try {
    C.func(1, 2 ,3, 4); /// static type warning
  } catch(e) {}
}

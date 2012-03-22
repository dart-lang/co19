/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names may be introduced into a scope by  declarations within the
 * scope or by other mechanisms such as imports or inheritance.
 * @description Checks that names may be introduced into a scope by inheritance.
 * @author msyabro
 * @reviewer iefremov
 */


class S {
  var x;
  var y;
  method(p1, p2) {}
}

class C extends S{
  test() {
    x = 1;
    y = 2;
    method(x, y);
  }
}

main() {
  new C().test();
}

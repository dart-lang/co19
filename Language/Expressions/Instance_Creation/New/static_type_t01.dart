/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an instance creation expression of either the
 * form new T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) or the form
 * new T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) is T.
 * It is a static warning if the static type of ai , 1 <= i <= n + k may not
 * be assigned to the type of the corresponding formal parameter of the
 * constructor T.id (respectively T).
 * @description Checks that the static type of an instance creation expression
 * is T.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  C() {}
  C.name() {}
}

class R {
  R(): this.redirect();
  R.name(): this.redirect();
  R.redirect() {}
}

abstract class I {
  factory I() = F;
  factory I.name() = F.name;
}

class F implements I {
  F() {}
  F.name() {}
}

main() {
  C c = new C();
  C cNamed = new C.name();

  R r = new R();
  R rNamed = new R.name();

  I i = new I();
  I iNamed = new I.name();
}

// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion The effect of a type alias of the form typedef id = T; declared in
 * a library L is to introduce the name id into the scope of L, bound to the
 * type T .
 * @description Checks that type alias of the form typedef id = T; introduces
 * the name id into the scope of L, bound to the type T .
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";
import "scope.lib.dart";

class X {
  static void s() {
    AAlias aa = new A();
    Expect.isTrue(aa is A);
    Expect.isTrue(aa is AAlias);

    CAlias<String> ca = new C<String>();
    Expect.isTrue(ca is C<String>);
    Expect.isTrue(ca is CAlias<String>);
  }

  void m() {
    AAlias aa = new A();
    Expect.isTrue(aa is A);
    Expect.isTrue(aa is AAlias);

    CAlias<String> ca = new C<String>();
    Expect.isTrue(ca is C<String>);
    Expect.isTrue(ca is CAlias<String>);
  }
}

test() {
  AAlias aa = new A();
  Expect.isTrue(aa is A);
  Expect.isTrue(aa is AAlias);

  CAlias<String> ca = new C<String>();
  Expect.isTrue(ca is C<String>);
  Expect.isTrue(ca is CAlias<String>);
}

main() {
  AAlias aa = new A();
  Expect.isTrue(aa is A);
  Expect.isTrue(aa is AAlias);

  CAlias<String> ca = new C<String>();
  Expect.isTrue(ca is C<String>);
  Expect.isTrue(ca is CAlias<String>);

  test();
  X.s();
  new X().m();
}

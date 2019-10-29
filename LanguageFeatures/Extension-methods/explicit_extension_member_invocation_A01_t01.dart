/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An extension application is an expression of the form E(expr) or
 * E<typeArgs>(expr) where E denotes an extension declaration (that is, E a
 * simple or qualified identifier which refers to the extension declaration).
 *
 * An extension application is subject to static type inference. If E is an
 * extension declared as extension E<X...> on T {...}, then the type inference
 * for an extension application is done exactly the same as it would be for the
 * same syntax considered as a constructor invocation on a class declared as:
 *
 *  class E<X...> {
 *    final T $target;
 *    E(this.$target);
 *  }
 * with no context type for the constructor invocation.
 *
 * @description Check that an extension application is subject to static type
 * inference
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class A {
  String name = "My name is A";
}

class C extends A {
  String name = "My name is C";
}

extension ExtendedA on A {
  String checkme() => this.name;
}

extension ExtendedC on C {
  String checkme() => this.name;
}

main() {
  A a = A();
  C c = C();
  A ac = new C();
  Expect.equals("My name is A", ExtendedA(a).checkme());
  Expect.equals("My name is C", ExtendedC(c).checkme());
  Expect.equals("My name is C", ExtendedC(ac).checkme());
}

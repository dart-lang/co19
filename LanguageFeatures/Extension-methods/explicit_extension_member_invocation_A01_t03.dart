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

class A {}

class C extends A {}

class X<T extends A> {
  String name = "My name is X";
}

extension ExtendedX<T extends C> on X<T> {
  String checkme() => this.name;
}

main() {
  X<A> x = X<A>();
  ExtendedX(x).checkme();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

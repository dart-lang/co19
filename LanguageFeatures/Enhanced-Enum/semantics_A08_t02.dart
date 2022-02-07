// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Static values list: A static constant variable named values is
/// added as by the declaration static const List<Name> values = [id1, …, idn];
/// where id1…idn are the names of the enum entries of the enum declaration in
/// source/index order. If Name is generic, the List<Name> instantiates Name to
/// its bounds.
///
/// @description Check that if `Name` is generic, the `List<Name>` instantiates
/// it to its bounds.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

class A {
  const A();
}

class B extends A {
  const B();
}

class C extends A {
  const C();
}

enum E<T extends A> {
  e0(),
  e1<A>(),
  e2<B>(),
  e3<C>();
}

main() {
  Expect.isTrue(E.values[0] is E<A>);
  Expect.isFalse(E.values[0] is E<B>);
  Expect.isFalse(E.values[0] is E<C>);
  Expect.runtimeIsType<E<A>>(E.values[0]);
  Expect.runtimeIsNotType<E<B>>(E.values[0]);
  Expect.runtimeIsNotType<E<C>>(E.values[0]);

  Expect.isTrue(E.values[1] is E<A>);
  Expect.isFalse(E.values[1] is E<B>);
  Expect.isFalse(E.values[1] is E<C>);
  Expect.runtimeIsType<E<A>>(E.values[1]);
  Expect.runtimeIsNotType<E<B>>(E.values[1]);
  Expect.runtimeIsNotType<E<C>>(E.values[1]);

  Expect.isTrue(E.values[2] is E<A>);
  Expect.isTrue(E.values[2] is E<B>);
  Expect.isFalse(E.values[2] is E<C>);
  Expect.runtimeIsType<E<A>>(E.values[2]);
  Expect.runtimeIsType<E<B>>(E.values[2]);
  Expect.runtimeIsNotType<E<C>>(E.values[2]);

  Expect.isTrue(E.values[3] is E<A>);
  Expect.isFalse(E.values[3] is E<B>);
  Expect.isTrue(E.values[3] is E<C>);
  Expect.runtimeIsType<E<A>>(E.values[3]);
  Expect.runtimeIsNotType<E<B>>(E.values[3]);
  Expect.runtimeIsType<E<C>>(E.values[3]);
}

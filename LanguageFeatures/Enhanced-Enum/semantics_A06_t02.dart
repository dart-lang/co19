// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Also a static constant named values is added as:
///
/// static const List<Name> values = [id1, …, idn]; where id1…idn are the names
/// of the enum entries of the enum declaration in source/index order. If Name
/// is generic, the List<Name> instantiates it to bounds.
///
/// @description Check that if Name is generic, the List<Name> instantiates it
/// to bounds.
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
  e1<A>(),
  e2<B>(),
  e3<C>();
}

main() {
  Expect.isTrue(E.values[0] is A);
  Expect.isFalse(E.values[0] is B);
  Expect.isFalse(E.values[0] is C);

  Expect.isTrue(E.values[1] is A);
  Expect.isFalse(E.values[1] is B);
  Expect.isFalse(E.values[1] is C);

  Expect.isTrue(E.values[2] is A);
  Expect.isFalse(E.values[2] is B);
  Expect.isFalse(E.values[2] is C);
}

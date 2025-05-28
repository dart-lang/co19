// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
/// ...
/// It's a compile-time error if a class or mixin declaration has Enum as a
/// superinterface, and that class or mixin declares or inherits a concrete
/// instance member named `index`, `hashCode` or `==` (an `operator ==`
/// declaration). That `index` member could override the `index` getter
/// inherited from `Enum`, and we currently do not allow that. The `hashCode`
/// and `operator ==` declarations would prevent the enum class from having
/// "primitive equality", and we want to ensure that enums can be used in
/// switches.
///
/// @description Check that it's not an error if an enum declaration has `Enum`
/// as a superinterface, and it declares a non-abstract instance member named
/// `index`.
/// @author sgrekhov@unipro.ru
/// @issue 48353

import '../../Utils/expect.dart';

enum E1 {
  e1,
  e2;

  void set index(int val) {}
}

enum E2 {
  e1(42),
  e2(0);

  const E2(int i);
  void set index(List<E2> val) {}
}

main() {
  E1.e1.index = 42;
  Expect.equals(0, E1.e1.index);
  E1.e2.index = 42;
  Expect.equals(1, E1.e2.index);

  E2.e1.index = <E2>[];
  Expect.equals(0, E2.e1.index);
  E2.e2.index = <E2>[];
  Expect.equals(1, E2.e2.index);
}

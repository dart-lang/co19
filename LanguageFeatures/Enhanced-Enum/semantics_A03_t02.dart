// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Superclass: The superclass of C is an implementation-specific built-in class
/// EnumImpl, with the mixins declared by E applied. (The EnumImpl class may be
/// the Enum class itself or it may be another class which extends or implements
/// Enum, but as seen from a non-platform library the interface of EnumImpl is
/// the same as that of Enum, and its methods work as specified for Enum )
///
/// If E is declared as enum Name with Mixin1, Mixin2 … then the superclass of C
/// is the mixin application EnumImpl with Mixin1, Mixin2.
/// It’s a compile-time error if such a mixin application introduces any
/// instance variables. We need to be able to call an implementation specific
/// superclass const constructor of Enum, and a mixin application of a mixin
/// with a field does not make its forwarding constructor const. Currently
/// that’s the only restriction, but if we add further restrictions on mixin
/// applications having const forwarding constructors, those should also apply
/// here.
///
/// @description Check that superclass of `C` is the mixin application
/// `EnumImpl` with `Mixin1`, `Mixin2`.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

mixin M1 on Object {
  int mixedInMethod1(int v) => v;
}

mixin M2 on Enum {
  int mixedInMethod2(int i) => index + i;
}

enum E with M1, M2 {
  e1(1, 1),
  e2(2, 2),
  e3(3, 3);

  final int val1;
  final int val2;

  const E(this.val1, this.val2);

  int get test1 => super.mixedInMethod1(val1);
  int get test2 => super.mixedInMethod2(val2);
}

main() {
  Expect.equals(1, E.e1.test1);
  Expect.equals(1, E.e1.test2);
  Expect.equals(2, E.e2.test1);
  Expect.equals(3, E.e2.test2);
  Expect.equals(3, E.e3.test1);
  Expect.equals(5, E.e3.test2);
}

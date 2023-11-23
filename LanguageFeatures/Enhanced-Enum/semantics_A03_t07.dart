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
/// @description Check that it’s a compile-time error if such a mixin
/// application introduces late final variables.
/// @author sgrekhov@unipro.ru

mixin M1 on Object {
  int mixedInMethod1(int v) => v;
}

mixin M2 on Enum {
  late final int i2 = 1;
  int mixedInMethod2(int i) => index + i;
}

enum E with M1, M2 {
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;
}

main() {
  E.e1;
}

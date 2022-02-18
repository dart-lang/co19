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
/// It's a compile-time error if a class or mixin declaration has `Enum` as a
/// superinterface and the interface of the declarations contains an instance
/// member with the name `values`, whether declared or inherited. If any
/// concrete class implements this interface, it will be an enum declaration
/// class, and then the `values` member would conflict with the static `values`
/// constant getter that is automatically added to enum declaration classes.
/// Such an instance `values` declaration is either useless or wrong, so we
/// disallow it entirely.
///
/// @description Check that it's a compile-time error if a mixin has Enum as a
/// superinterface and the interface of the declarations contains an instance
/// member with the name `values`
/// @author sgrekhov@unipro.ru
/// @issue 48388

// SharedOptions=--enable-experiment=enhanced-enums

mixin M1 on Enum {
  void set values(int val) {}
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 on Enum {
  void set values(List val) {}
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
}

// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if the enum declaration contains a
/// static or instance member declaration with the name `values`, or if the
/// superclass or any superinterface of the enum declaration has an interface
/// member named `values`. A `values` static constant member will be provided
/// for the class, this restriction ensures that there is no conflict with that
/// declaration.
///
/// @description Check that it's a compile-time error if the enum declaration
/// contains a static member declaration with the name `values`
/// @author sgrekhov@unipro.ru
/// @issue 48387

// SharedOptions=--enable-experiment=enhanced-enums

enum E1<T> {
  e1,
  e2,
  e3;

  static int values = 42;
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1,
  e2,
  e3;

  static final int values = 42;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3<T> {
  e1<int>(1),
  e2<String>("2"),
  e3<bool>(true);

  const E3(Object val);
  static List<E3> values = [];
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4<T> {
  e1<int>(1),
  e2<String>("2"),
  e3<bool>(true);

  const E4(Object val);
  static final List<E4> values = [];
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e1;
  E3.e1;
  E4.e1;
}

// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The requirement that the condition in a boolean conditional
/// control expression (e.g. the a conditional statement, conditional element,
/// while loop, etc) be assignable to bool is unchanged from pre null-safe Dart.
/// The change in assignability means that the static type of the condition may
/// only be dynamic, Never, or bool
///
/// @description Checks that the static type of the condition (in assignability)
/// may be dynamic, Never, or bool
///
/// @author sgrekhov@unipro.ru

void foo() {}

main() {
  bool x = 42;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  x = "true";
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  x = null;
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  x = foo();
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Object? o = true;
  x = o;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

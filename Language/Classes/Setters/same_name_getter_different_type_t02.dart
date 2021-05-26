// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  It is a compile error if a class has a setter named 'v=' with
/// argument type T and a getter named 'v' with return type S, and T may not be
/// assigned to S.
/// @description Checks that it is a compile error if class defines a setter
/// named 'foo=' and a getter named 'foo' with argument/return types that are
/// not mutually assignable. Types in getter/setter signatures provided
/// explicitly (String and double).
/// @author iefremov


class C {
  set foo(double d) {
  }
  String get foo => "";
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C().foo = new C().foo;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}


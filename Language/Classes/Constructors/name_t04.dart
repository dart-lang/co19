// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constructor name always begins with the name of its immediately
/// enclosing class, and may optionally be followed by a dot and an identifier
/// id. It is a compile-time error if the name of a constructor is not a
/// constructor name.
/// A constructor declaration may conflict with static member declarations
/// (10.11).
/// Let C be a class. It is a compile-time error if C declares a
///  • constructor named C.n and a static member with basename n.
///
/// @description Checks that a compile-error is produced when a constructor's id
/// coincides with the name of a static method declared in the same class.
/// @author kaigorodov


class C {
  C.foo() {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static foo() {}
//       ^^^
// [cfe] unspecified
}

main() {
  new C.foo();
}

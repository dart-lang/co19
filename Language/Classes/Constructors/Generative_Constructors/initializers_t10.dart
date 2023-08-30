// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// initializers:
///   ':' superCallOrFieldInitializer (', ' superCallOrFieldInitializer)*
/// ;
/// superCallOrFieldInitializer:
///   super arguments  | super '.' identifier arguments | fieldInitializer
/// ;
/// fieldInitializer:
///   (this '.')? identifier '=' conditionalExpression cascadeSection*
/// ;
/// @description Checks that it is a compile-time error when the field
/// initializer does not include the field identifier.
/// @author iefremov


class C {
  C() : = 1 {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  var x;
}

main() {
  new C();
}

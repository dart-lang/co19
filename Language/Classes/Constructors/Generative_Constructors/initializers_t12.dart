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
/// @description Checks that it is a compile-time error when there's just the
/// right-side expression in place of a field initializer.
/// @author rodionov


class C {
  C() : 2 + 2 {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  var x;
}

main() {
  new C();
}

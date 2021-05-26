// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A mixin application of the form S with M1,...,Mk; defines a class
/// C whose superclass is the application of the mixin composition
/// Mk−1 ∗ ... ∗ M1 to S
/// ...
/// It is a compile-time error if S is an enumerated type or a malformed type.
/// @description Checks that it is a compile-time error if S is a malformed type
/// @author sgrekhov@unipro.ru

var E;

class M {
}

class C = E with M;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}

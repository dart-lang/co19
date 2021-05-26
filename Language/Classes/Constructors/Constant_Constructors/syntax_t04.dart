// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// constantConstructorSignature:
///   const qualified formalParameterList
/// ;
/// @description Checks that it is a compile-time error if the semicolon at the
/// end of constructor declaration is missing.
/// @author iefremov


class A {
  const A()
//^
// [cfe] unspecified
}
//^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    var a = const A();
//                ^
// [cfe] unspecified
  } catch (x) {}
}

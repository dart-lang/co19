// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// constantConstructorSignature:
///   const qualified formalParameterList
/// ;
/// @description Checks that it is a compile-time error if the constructor name
/// is missing.
/// @author iefremov


class A {
  const ();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const A();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

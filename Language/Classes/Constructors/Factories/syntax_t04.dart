// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A factory is a constructor prefaced by the built-in identifier
/// factory.
/// factoryConstructorSignature:
///   factory identifier ('.' identifier)? formalParameterList
/// ;
/// @description Checks that it is a compile-time error if a factory constructor
/// declaration is missing the formal parameter list.
/// @author iefremov


class C {
  factory C{}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    new C();
  } catch (x) {}
}

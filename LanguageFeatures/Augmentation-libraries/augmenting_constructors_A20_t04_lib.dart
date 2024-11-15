// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented factory constructor has a body, or it is redirecting.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting factory constructor if an introductory constructor has any
/// default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A20_t04.dart';

augment class C {
  augment factory C.bar([int x = 0]) = C;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.baz({int x = 0}) = C.foo;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment factory ET.baz([int x = 0]) = ET;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.qux({int x = 0}) = ET.foo;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

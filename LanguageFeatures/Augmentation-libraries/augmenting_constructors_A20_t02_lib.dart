// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented factory constructor has a body, or it is redirecting.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor references itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A20_t02.dart';

augment class C {
  augment factory C.foo(int x) = C.foo;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.bar([int x]) = C.bar;
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.baz({int x = 0}) = C.baz;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.qux({required int x}) = C.qux;
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified
}


augment extension type ET {
  augment factory ET(int x) = ET.foo;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

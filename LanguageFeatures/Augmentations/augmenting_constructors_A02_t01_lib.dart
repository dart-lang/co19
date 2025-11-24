// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting constructor parameters specify any default values.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor parameters specify any default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A02_t01.dart';

augment class C {
  augment C([int x = 0]);
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.c1({int x = 0});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E([int x = 0]);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  augment const E.c1({int x = 0});
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.c1(this.id, [int x = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.c2(this.id, {int x = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

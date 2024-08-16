// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the constructor augmentation does not match the original
///   constructor. It must have the same number of positional parameters, the
///   same named parameters, and matching parameters must have the same type,
///   optionality, and any required modifiers must match. Any initializing
///   formals and super parameters must also be the same in both constructors.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test wrong
/// type of parameters in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A01_t04.dart';

augment class C {
  augment C(int x, [num y]);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C(num x, [int y]);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(Object x, {required num y, num z});
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(num x, {required Object y, num z});
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(num x, {required num y, Object z});
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E(int x, [num y]);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E(num x, [int y]);
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(Object x, {required num y, num z});
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(num x, {required Object y, num z});
//                                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(num x, {required num y, Object z});
//                                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(int x, [num y = 0]);
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(num x, [int y = 0]);
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(Object x, {required num y, num z = 0});
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(num x, {required Object y, num z = 0});
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(num x, {required num y, Object z = 0});
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

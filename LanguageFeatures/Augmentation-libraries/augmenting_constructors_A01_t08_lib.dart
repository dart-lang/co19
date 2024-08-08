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
/// @description Checks that it is a compile-time error if super parameters
/// of the constructor augmentation does not match the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A01_t08.dart';

augment class C1 {
  augment C1(super.y, super.x);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C1.foo([super.y, super.x]);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment C2({super.y, super.x});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C2.foo({super.y, super.x});
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

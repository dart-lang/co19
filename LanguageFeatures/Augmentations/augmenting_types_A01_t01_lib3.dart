// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and the corresponding type are not the same kind.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'augmenting_types_A01_t01.dart';

augment class Ext3 {}
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin ET3 {}
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum F3 {e3;}
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension C3 {}
//                ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type M3(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef void E3();
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

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

part of 'applying_augmentations_A01_t01.dart';

augment class ET4 {}
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin F4 {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum C4 {e4;}
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension M4 {}
//                ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type E4(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef void Ext4();
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

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

// SharedOptions=--enable-experiment=augmentations

part of 'augmenting_types_A01_t01.dart';

augment class F {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment enum M {augment e1;}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension E {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type Ext(int _) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef void ET();
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

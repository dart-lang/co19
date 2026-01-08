// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if an augmented
/// declaration is a type alias and an augmenting declaration is not
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'applying_augmentations_A01_t02.dart';

augment class CAlias1 {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class MAlias1 {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class EAlias1 {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class ETAlias1 {}
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

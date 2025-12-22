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

// SharedOptions=--enable-experiment=augmentations

part of 'augmenting_types_A01_t02.dart';

augment mixin CAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin MAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin EAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin ETAlias {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

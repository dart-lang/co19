// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
///
/// - The augmenting type and corresponding type are not the same kind: class,
///   mixin, enum, or extension. You can't augment a class with a mixin, etc.
///
/// @description Checks that it is a compile-time error if an augmenting type is
/// a type alias of a different type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A01_t02.dart';

augment mixin CAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class MAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class EAlias {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

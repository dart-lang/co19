// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration `D` is a declaration marked with the
/// built-in identifier `augment`. We add `augment` as a built-in identifier as
/// a language versioned change, to avoid breaking pre-feature code.
///
/// `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before the introductory one. Test augmenting declaration
/// in a main library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of  'augmenting_declarations_A02_t03.dart';

void function() {}
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int get getter => 0;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void set setter(int _) {}
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

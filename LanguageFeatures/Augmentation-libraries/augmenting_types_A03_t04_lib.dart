// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting declaration declares an `extends` clause for a `class`
///   declaration, but one was already present (or the `class` was a
///   `mixin class` declaration, which does not allow `extends` clauses).
///
/// @description Checks that it is a compile-time error if an augmentation adds
/// `extends` clause to `mixin class` declaration.
/// @author sgrekhov22@gmail.com
/// @issue 55454

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A03_t04.dart';

class A {}

augment mixin class C1 extends Object {}
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C2 extends A {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

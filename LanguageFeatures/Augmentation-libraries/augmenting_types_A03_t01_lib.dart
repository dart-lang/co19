// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting type declares an extends clause, but one was already
///   present. We don't allow overwriting an existing extends, but one can be
///   filled in if it wasn't present originally.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares an extends clause, but one was already present
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A03_t01.dart';

augment class C extends A {}
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D {}

augment class C extends D {}
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

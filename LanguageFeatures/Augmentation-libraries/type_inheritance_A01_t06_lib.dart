// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that it is a syntax error if an augmenting declaration of
/// an extension type has no type annotations for the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A01_t06.dart';

augment extension type ET1(id) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET2(var id) {}
//                         ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET3(final id) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

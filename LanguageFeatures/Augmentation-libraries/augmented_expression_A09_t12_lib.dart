// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error to declare an enum value
/// whose name is `augmented` in a location where there is an enclosing
/// augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t12.dart';

augment enum E {
  augment e1,
  augmented;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

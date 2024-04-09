// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that it is a compile-time error if a class, extension
/// type, mixin or enum augment specifies `implements` clause but doesn't
/// implement this interface
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A07_t03.dart';

augment class C implements I {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M implements I {}

augment enum E implements I {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

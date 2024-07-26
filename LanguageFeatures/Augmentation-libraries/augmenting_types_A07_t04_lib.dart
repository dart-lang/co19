// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when generally
/// supported). The types in these clauses are appended to the introductory
/// declarations’ clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types. All regular rules apply
/// after this appending process, so you cannot have multiple `extends` on a
/// class, or an `on` clause on an enum, etc.
///
/// @description Checks that it is a compile-time error if a class, extension
/// type, mixin or enum augment specifies a base class in an `implements` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A07_t04.dart';
import 'augmentation_libraries_lib.dart';

augment class C implements BaseClass {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M implements BaseClass {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E implements BaseClass {
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

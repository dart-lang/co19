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
/// @description Checks that it is a compile-time error if a class augment
/// specifies an interface in an `implements` clause which is not compatible
/// with existing interfaces
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_types_A07_t08.dart';

augment class C1 implements I2 {
  int foo() => 0;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C2 implements I2 {}

augment mixin M implements I2 {}

augment enum E implements I2 {
  augment e1;
}

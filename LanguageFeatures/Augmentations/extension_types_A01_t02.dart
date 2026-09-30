// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An introductory extension type declaration must have a primary
/// constructor clause, which must have precisely one parameter. Just like for a
/// class or enum, that primary constructor clause is a constructor declaration
/// which can't be augmented. For an extension type, it is an introductory and
/// complete initializing constructor declaration.
///
/// @description Checks that it is a compile-time error to specify a constructor
/// name only in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

extension type ET1.foo(int id) {}

augment extension type ET1.foo {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2.new(int id) {}

augment extension type ET2.new {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
}

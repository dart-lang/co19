// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension type's representation object is not a variable,
/// even though it looks and behaves much like one, and it cannot be augmented
/// as such. It is a compile time error to have any augmenting declaration with
/// the same name as the representation object.
///
/// @description Checks that it is a compile-time error to declare any
/// augmenting declaration with the same name as the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'extension_types_A03_t01.dart';

augment extension type ET1 {
  augment final int id;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2 {
  augment int get id => 0;
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2(int id) {
  augment int get id;
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET3(int id) {
  augment int id() => 0;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET3(int id) {
  augment int id();
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

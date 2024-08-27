// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that it is a compile-time error if an augmentation of an
/// extension type's implicit constructor has a signature which doesn't exactly
/// match the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'extension_types_A02_t03.dart';

augment extension type ET1 {
  augment ET1(this.id, int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2 {
  augment ET2(this.id, [int x = 0]);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET3 {
  augment ET3(this.id, {int x = 0});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET4 {
  augment ET4(): this.id = 0;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET5 {
  augment ET5([this.id = 0]);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET6 {
  augment ET6({this.id = 0});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET7 {
  augment ET7({required this.id});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET8 {
  augment ET8(Object this.id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET8(int this.id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET9 {
  augment ET9(this.id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

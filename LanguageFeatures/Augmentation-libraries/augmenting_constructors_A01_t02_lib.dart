// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the constructor augmentation does not match the original
///   constructor. It must have the same number of positional parameters, the
///   same named parameters, and matching parameters must have the same type,
///   optionality, and any required modifiers must match. Any initializing
///   formals and super parameters must also be the same in both constructors.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test wrong
/// number of optional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A01_t02.dart';

augment class C {
  augment C();
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  augment C([int x, int y]);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment C.n();
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.n({int x, int y});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E();
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  augment const E([int x, int y]);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment const E.n();
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment const E.n({int x, int y});
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo([int x, int y]);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.baz();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz({int x, int y});
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

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
/// names of named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A01_t03_lib.dart';

class C {
  C({int x = 0});
}

enum E {
  e0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  const E({int x = 0});
}

extension type ET(int id) {
  ET.baz({int x = 0}): this.id = 0;
}

main() {
  print(C);
  print(E);
  print(ET);
}

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
/// @description Checks that it is a compile-time error if super parameters
/// of the constructor augmentation does not match the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A01_t08_lib.dart';

class A1 {
  A1(int x, int y);
}

class C1 extends A1 {
  C1(super.x, super.y);
  C1.foo([super.x = 1, super.y = 1]);
}

class A2 {
  A2({int x = 0, int y = 0});
}

class C2 extends A2 {
  C2({super.x = 1, super.y = 1});
  C2.foo({required super.x, required super.y});
}

main() {
  print(C1);
  print(C2);
}

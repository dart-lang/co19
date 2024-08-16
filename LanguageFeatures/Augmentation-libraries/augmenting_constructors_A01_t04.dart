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
/// type of parameters in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A01_t04_lib.dart';

class C {
  C(num x, [num y = 0]);
  C.foo(num x, {required num y, num z = 0});
}

enum E {
  e0(0);
//^^
// [analyzer] unspecified
// [cfe] unspecified
  const E(num x, [num y = 0]);
  const E.foo(num x, {required num y, num z = 0});
}

extension type ET(int id) {
  ET.foo(num x, [num y = 0]): this.id = 0;
  ET.baz(num x, {required num y, num z = 0}): this.id = 0;
}

main() {
  print(C);
  print(E);
  print(ET);
}

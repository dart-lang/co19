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
/// optionality of parameters in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A01_t05_lib.dart';

class C {
  C(int? x);
  C.foo([int? y = 0]);
  C.bar({int? z = 0});
  C.baz({required int? v});
}

enum E {
  e0(0);
  const E(int? x);
  const E.foo([int? y = 0]);
  const E.bar({int? z = 0});
  const E.baz({required int? v});
}

extension type ET(int? id) {
  ET.foo(int? x): this.id = 0;
  ET.bar([int? y = 0]): this.id = 0;
  ET.baz({int? z = 0}): this.id = 0;
  ET.qux({required int? v}): this.id = 0;
}

main() {
  print(C);
  print(E);
  print(ET);
}

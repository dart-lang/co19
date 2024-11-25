// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has an initializer list or a body, or it has a
///   redirection.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has
/// initialising formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A18_t01_lib.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  C.bar({required this.y});
}

enum E {
  e0(1, 2), e1.foo(3, y: 4), e2.bar(5, y: 6);
  final int x, y;
  const E(this.x, [this.y = 0]);
  const E.foo(this.x, {this.y = 0});
  const E.bar(this.x, {required this.y});
}

extension type ET(int x) {
  ET.foo(this.x);
  ET.bar({required this.x});
}

main() {
  print(C);
  print(E);
  print(ET);
}

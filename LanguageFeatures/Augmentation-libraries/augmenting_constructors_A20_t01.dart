// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented factory constructor has a body, or it is redirecting.
///
/// @description Checks that it is a compile-time error if the augmented
/// constructor has a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A20_t01_lib.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  factory C.bar(int x, [int y = 0]) => C(x, y);
  factory C.baz(int x, {int y = 0}) => C.foo(x, y: y);
  factory C.qux(int x, [int y = 0]) => D(x, y);
}

class D extends C {
  D(super.x, [super.y = 0]);
}

extension type ET(int x) {
  ET.foo(this.x);
  factory ET.bar(int x) => ET(x);
  factory ET.baz(int x) => ET.foo(x);
}

main() {
  print(C);
  print(D);
  print(ET);
}

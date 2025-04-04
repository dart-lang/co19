// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting factory constructors
/// ...
/// It is a compile-time error if:
/// - The augmented factory constructor has a body, or it is redirecting.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor references itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A20_t02_lib.dart';

class C {
  int x;
  C(this.x);
  factory C.foo(int x);
  factory C.bar([int x = 0]);
  factory C.baz({int x = 0});
  factory C.qux({required int x});
}

extension type ET(int x) {
  factory ET.foo(int x);
}

main() {
  print(C);
  print(ET);
}

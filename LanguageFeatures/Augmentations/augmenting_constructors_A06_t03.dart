// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting declaration and augmented declaration do not have the same
///   `const` and `factory` modifiers.
///
/// @description Checks that it is not an error if an introductory generative
/// constructor of an enum is `const` and the augmenting constructor is not, or
/// vice versa.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

enum E1 {
  e0;
  const E1();
}

augment enum E1 {
  ;
  augment E1(); // `const` can be inferred for enum constructors.
}

enum E2 {
  e0;
  E2();
}

augment enum E2 {
  ;
  augment const E2();
}

enum E3 {
  e0.foo(1), e1.bar(2), e2.baz(x: 3), e3.qux(x: 4);

  final int x;
  const E3.foo(this.x);
  const E3.bar([int x = 0]);
  E3.baz({required this.x});
  E3.qux({int x = 0});
}

augment enum E3 {
  ;
  augment E3.foo(int x);
  augment E3.bar([int x]) : x = x;
  augment const E3.baz({required int x});
  augment const E3.qux({int x}) : x = x;
}

enum E4 {
  e0, e1.named();

  final String s;
  const E4() : s = "Original";
  E4.named() : this._("Redirected");
  const E4._(this.s);
}

augment enum E4 {
  ;
  augment E4();
  augment const E4.named();
  augment E4._(String s);
}

main() {
  print(E1);
  print(E2);
  Expect.equals(1, E3.e0.x);
  Expect.equals(2, E3.e1.x);
  Expect.equals(3, E3.e2.x);
  Expect.equals(4, E3.e3.x);
  Expect.equals("Original", E4.e0.s);
  Expect.equals("Redirected", E4.e1.s);
}

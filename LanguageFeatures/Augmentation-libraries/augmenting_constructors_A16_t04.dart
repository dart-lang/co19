// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
///
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that it is a compile-time error to call `augmented()` in
/// a factory constructor body with a formal parameters which don't match the
/// signature of the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A16_t04_lib.dart';

class C {
  int x, y;
  C(this.x, this.y);
  factory C.foo(int x, [int y = 0]) => C(x, y);
  factory C.bar(int x, {int y = 0}) => C(x, y);
  factory C.baz({required int x}) => C(x, 0);
}

extension type ET(int id) {
  factory ET.foo(int x) => ET(x);
  factory ET.bar([int x = 0]) => ET(x);
  factory ET.baz({int x = 0}) => ET(x);
  factory ET.qux({required int x}) => ET(x);
}

main() {
  print(C);
  print(ET);
}

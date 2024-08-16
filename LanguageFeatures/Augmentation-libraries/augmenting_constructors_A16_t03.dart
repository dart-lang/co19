// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that `augmented(arguments)` in the body of augmenting
/// non-redirecting factory constructor calls the introductory constructor with
/// appropriate parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A16_t05_lib.dart';
import '../../Utils/expect.dart';

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
  Expect.equals(2, C.foo(1).x);
  Expect.equals(1, C.foo(1).y);
  Expect.equals(2, C.foo(1, 1).x);
  Expect.equals(2, C.foo(1, 1).y);

  Expect.equals(2, C.bar(1).x);
  Expect.equals(1, C.bar(1).y);
  Expect.equals(2, C.bar(1, y: 1).x);
  Expect.equals(2, C.bar(1, y: 1).y);

  Expect.equals(2, C.baz(x: 1).x);
  Expect.equals(0, C.baz(x: 1).y);

  Expext.equals(2, ET.foo(1).id);
  Expext.equals(1, ET.bar().id);
  Expext.equals(2, ET.bar(1).id);
  Expext.equals(1, ET.baz().id);
  Expext.equals(2, ET.baz(x: 1).id);
  Expext.equals(2, ET.qux(x: 1).id);
}

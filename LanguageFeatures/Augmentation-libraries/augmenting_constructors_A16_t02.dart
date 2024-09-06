// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that augmenting non-redirecting factory constructor may
/// replace a body of an introductory factory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A16_t02_lib.dart';

class C {
  int x;
  C(this.x);
  factory C.foo() => C(0);
}

extension type ET(int id) {
  factory ET.foo() => ET(0);
}

main() {
  Expect.equals(1, C.foo().x);
  Expect.equals(1, ET.foo().id);
}

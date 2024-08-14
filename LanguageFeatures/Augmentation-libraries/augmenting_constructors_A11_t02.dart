// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - Initializer lists are not re-run, they have already executed and
///     shouldn't be executed twice. The same goes for initializing formals and
///     super parameters.
///
/// @description Checks that when `augmented()` is called in the body of an
/// augmenting constructor initializing formals are not re-run.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A11_t02_lib.dart';
import '../../Utils/expect.dart';

class C {
  final String x;
  void set x(String _) {
    Expect.fail("Setter should not be called");
  }
  C(this.x);
}

extension type ET(String id) {
  void set id(String _) {
    Expect.fail("Setter should not be called");
  }
  ET.foo(this.id);
}

main() {
  Expect.equals("Original", C("Original").x);
  Expect.equals("Original", ET.foo("Original").id);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - If a parameter variable is overwritten prior to calling `augmented()`,
///     the augmented body will see the updated value, because the parameter
///     scope is identical.
///
/// @description Checks that if a parameter variable is overwritten prior to
/// calling `augmented()`, the augmented body see the updated value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A12_t01_lib.dart';

class C {
  String x = "";
  String y = "";
  C(String v1, [String v2 = "default"]) {
    x = v1;
    y = v2;
  }
}

String log = "";

extension type ET(int x) {
  ET.foo(this.x, String s) {
    log = s;
  }
}

main() {
  C c1 = C("Original");
  Expect.equals("Augmented", c1.x);
  Expect.equals("Augmented", c1.y);
  C c2 = C("Original", "Original");
  Expect.equals("Augmented", c2.x);
  Expect.equals("Augmented", c2.y);

  ET et = ET.foo(42, "Original");
  Expect.equals("Augmented", log);
}

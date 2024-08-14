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
/// augmenting constructor initializer lists are not re-run.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A11_t01_lib.dart';
import '../../Utils/expect.dart';

class C {
  String x;
  C(): x = "Original";
}

extension type ET(String id) {
  ET.foo(): id = "Original";
}

main() {
  Expect.equals("Augmented", C().x);
  Expect.equals("Augmented", ET.foo().id);
}

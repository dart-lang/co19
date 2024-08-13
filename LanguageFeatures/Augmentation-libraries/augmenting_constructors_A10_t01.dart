// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - In the augmenting constructor's body, an `augmented()` call executes the
///     augmented constructor's body in the same parameter scope that the
///     augmenting body is executing in. The expression has type `void` and
///     evaluates to `null`.
///
/// @description Checks that in the augmenting constructor's body, an
/// `augmented()` call executes the augmented constructor's body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A10_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class C {
  C() {
    _log += "Original;";
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    _log += "Original;";
  }
}

main() {
  C();
  Expect.equals("Original;Original;Augmented", _log);
  _log = "";
  ET(0);
  Expect.equals("Original;Original;Augmented", _log);
}

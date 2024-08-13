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
/// `augmented()` call executes the augmented constructor's body in the same
/// parameter scope that the augmenting body is executing in.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A10_t03_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class C {
  C(int x, [int y = 0]) {
    _log += "C($x, $y);";
  }
  C.foo(int x, {int y = 0}) {
    _log += "C.foo($x, $y);";
  }
  C.bar({required int x}) {
    _log += "C.bar($x);";
  }
}

extension type ET(int id) {
  ET.foo(this.id, [int y = 0]) {
    _log += "ET.foo($id, $y);";
  }
  ET.bar(this.id, {int y = 0}) {
    _log += "ET.bar($id, $y);";
  }
  ET.baz({required this.id}) {
    _log += "ET.baz($id);";
  }
}

main() {
  C(1);
  Expect.equals("C(1, 0);C(1, 0);", _log);
  _log = "";
  C(1, 2);
  Expect.equals("C(1, 2);C(1, 2);", _log);
  _log = "";
  C.foo(1);
  Expect.equals("C.foo(1, 0);C.foo(1, 0);", _log);
  _log = "";
  C.foo(1, y: 2);
  Expect.equals("C.foo(1, 2);C.foo(1, 2);", _log);
  _log = "";
  C.bar(1);
  Expect.equals("C.bar(1);C.bar(1);", _log);
  _log = "";

  ET.foo(1);
  Expect.equals("ET.foo(1, 0);ET.foo(1, 0);", _log);
  _log = "";
  ET.foo(1, 2);
  Expect.equals("ET.foo(1, 2);ET.foo(1, 2);", _log);
  _log = "";
  ET.bar(1);
  Expect.equals("ET.bar(1, 0);ET.bar(1, 0);", _log);
  _log = "";
  ET.bar(1, y: 2);
  Expect.equals("ET.bar(1, 2);ET.bar(1, 2);", _log);
  _log = "";
  ET.baz(1);
  Expect.equals("ET.baz(1);ET.baz(1);", _log);
}

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

augment library 'augmenting_constructors_A10_t03.dart';

augment class C {
  augment C(int x, [int y = 0]) {
    _log += "C($x, $y);";
    x++;
    y++;
    augmented();
  }
  augment C.foo(int x, {int y = 0}) {
    _log += "C.foo($x, $y);";
    x++;
    y++;
    augmented();
  }
  augment C.bar({required int x}) {
    _log += "C.bar($x);";
    x++;
    augmented();
  }
}

augment extension type ET {
  augment ET.foo(this.id, [int y = 0]) {
    _log += "ET.foo($id, $y);";
    y++;
    augmented();
  }
  augment ET.bar(this.id, {int y = 0}) {
    _log += "ET.bar($id, $y);";
    y++;
    augmented();
  }
  augment ET.baz({required this.id}) {
    _log += "ET.baz($id);";
    augmented();
  }
}

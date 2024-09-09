// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
///   - If the augmenting constructor has an explicit block body, then that body
///     replaces any existing constructor body.
///
/// @description Checks that if the augmenting constructor has an explicit block
/// body, then that body replaces any existing constructor body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A09_t01.dart';

augment class C1 {
  augment C1() {
    _log += "Augmented";
  }
}

augment class C2 {
  augment C2.new() {
    _log += "Augmented";
  }
}

augment class C3 {
  augment C3() {
    _log += "Augmented";
  }
}

augment extension type ET {
  augment ET.foo(this.id) {
    _log += "Augmented";
  }
}

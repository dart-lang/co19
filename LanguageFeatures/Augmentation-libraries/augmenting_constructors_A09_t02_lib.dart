// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
///
/// @description Checks that an augmenting constructor may add a body to an
/// augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A09_t02.dart';

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

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that if the augmenting constructor has an explicit block
/// body, then that body is executed after the body of the introductory
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A09_t01.dart';

augment class C1 {
  augment C1() {
    log += "Augmented";
  }
}

augment class C2 {
  augment C2.new() {
    log += "Augmented";
  }
}

augment class C3 {
  augment C3() {
    log += "Augmented";
  }
}

augment extension type ET {
  augment ET(int id) {
    log += "Augmented";
  }
  augment ET.foo(this.id) {
    log += "Augmented";
  }
}

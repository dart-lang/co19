// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that non-redirecting generative constructor bodies are
/// invoked in augmentation order, starting at the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A09_t07.dart';
part 'augmenting_constructors_A09_t07_lib2.dart'

augment class C {
  augment C() {
    log += "Augment 3;";
  }
  augment C.id() {
    log += "Augment 3;";
  }
}

augment extension type ET {
  augment ET(int id) {
    log += "Augment 3;";
  }
  augment ET.foo(this.id) {
    log += "Augment 3;";
  }
}

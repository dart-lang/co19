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

import '../../Utils/expect.dart';
part 'augmenting_constructors_A09_t07_lib1.dart';
part 'augmenting_constructors_A09_t07_lib3.dart';

String log = "";

class C {
  C() {
    log += "Introductory;";
  }
  C.id() {
    log += "Introductory;";
  }

  augment C() {
    log += "Augment 1;";
  }
  augment C.id() {
    log += "Augment 1;";
  }
}

augment class C {
  augment C() {
    log += "Augment 2;";
  }
  augment C.id() {
    log += "Augment 2;";
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    log += "Introductory;";
  }

  augment ET(int id) {
    log += "Augment 1;";
  }
  augment ET.foo(this.id) {
    log += "Augment 1;";
  }
}

augment extension type ET {
  augment ET.new(int id) {
    log += "Augment 2;";
  }
  augment ET.foo(this.id) {
    log += "Augment 2;";
  }
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C();
  checkLog("Introductory;Augment 1;Augment 2;Augment 3;Augment 4;Augment 5;");
  C.id();
  checkLog("Introductory;Augment 1;Augment 2;Augment 3;Augment 4;Augment 5;");

  ET(0);
  checkLog("Augment 1;Augment 2;Augment 3;Augment 4;Augment 5;");
  ET.foo(0);
  checkLog("Introductory;Augment 1;Augment 2;Augment 3;Augment 4;Augment 5;");
}

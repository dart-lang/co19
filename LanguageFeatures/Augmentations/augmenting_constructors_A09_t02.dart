// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that the augmenting constructor may provide a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = "";

class C1 {
  C1();
}

augment class C1 {
  augment C1() {
    log += "Augmented body";
  }
}

class C2 {
  C2();
}

augment class C2 {
  augment C2.new() {
    log += "Augmented body";
  }
}

class C3 {
  C3.new();
}

augment class C3 {
  augment C3() {
    log += "Augmented body";
  }
}

extension type ET1._(int id) {
  ET1(this.id);
  ET1.foo(this.id);
}

augment extension type ET1 {
  augment ET1(int id) {
    log += "Augmented body";
  }
  augment ET1.foo(this.id) {
    log += "Augmented body";
  }
}

extension type ET2._(int id) {
  ET2(this.id);
}

augment extension type ET2 {
  augment ET2.new(int _) {
    log += "Augmented body";
  }
}

extension type ET3._(int _) {
  ET3.new(this.id);
}

augment extension type ET3 {
  augment ET3(int _) {
    log += "Augmented body";
  }
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C1();
  checkLog("Augmented body");
  C2();
  checkLog("Augmented body");
  C3();
  checkLog("Augmented body");
  ET1(0);
  checkLog("Augmented body");
  ET1.foo(0);
  checkLog("Augmented body");
}

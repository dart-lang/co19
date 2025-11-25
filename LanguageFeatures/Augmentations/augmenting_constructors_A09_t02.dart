// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
/// ...
/// Augmenting constructors works similar to augmenting a function, with some
/// extra rules to handle features unique to constructors like redirections and
/// initializer lists.
///
/// @description Checks that if the augmenting constructor may provide a body.
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

extension type ET1(int id) {
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

extension type ET2(int _) {}

augment extension type ET2 {
  augment ET2.new(int _) {
    log += "Augmented body";
  }
}

extension type ET3.new(int _) {}

augment extension type ET3 {
  augment ET3.new(int _) {
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

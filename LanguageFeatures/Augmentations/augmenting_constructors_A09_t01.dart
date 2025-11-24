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

import '../../Utils/expect.dart';
part 'augmenting_constructors_A09_t01_lib.dart';

String log = "";

class C1 {
  C1() {
    log += "Original;";
  }
}

class C2 {
  C2() {
    log += "Original;";
  }
}

class C3 {
  C3.new() {
    log += "Original;";
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    log += "Original;";
  }
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C1();
  checkLog("Original;Augmented");
  C2();
  checkLog("Original;Augmented");
  C3();
  checkLog("Original;Augmented");
  ET(0);
  checkLog("Augmented");
  ET.foo(0);
  checkLog("Original;Augmented");
}

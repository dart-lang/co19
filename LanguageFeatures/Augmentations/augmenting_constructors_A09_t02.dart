// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that an augmenting constructor may add a body to an
/// augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A09_t02_lib.dart';

String log = "";

class C1 {
  C1();
}

class C2 {
  C2();
}

class C3 {
  C3.new();
}

extension type ET(int id) {
  ET.foo(this.id);
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C1();
  checkLog("Augmented");
  C2();
  checkLog("Augmented");
  C3();
  checkLog("Augmented");
  ET(0);
  checkLog("Augmented");
  ET.foo(0);
  checkLog("Augmented");
}

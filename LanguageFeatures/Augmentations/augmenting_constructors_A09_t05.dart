// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that introductory and augmented bodies are executed with
/// the same parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';

String log = "";

class C {
  C(int x, [int y = 0]) {
    log += "C(${x++}, ${y++});";
  }
  C.foo(int x, {int y = 0}) {
    log += "C.foo(${x++}, ${y++});";
  }
  C.bar({required int x}) {
    log += "C.bar(${x++});";
  }
}

augment class C {
  augment C(int x, [int y = 0]) {
    log += "C($x, $y);";
  }
  augment C.foo(int x, {int y = 0}) {
    log += "C($x, $y);";
  }
  augment C.bar({required int x}) {
    log += "C.bar($x);";
  }
}

extension type ET(int id) {
  ET.foo(this.id, [int y = 0]) {
    log += "ET.foo($id, ${y++});";
  }
  ET.bar(this.id, {int y = 0}) {
    log += "ET.bar($id, ${y++});";
  }
  ET.baz({required this.id, required int y}) {
    log += "ET.baz($id, ${y++});";
  }
}

augment extension type ET {
  augment ET.foo(this.id, [int y = 0]) {
    log += "ET.foo($id, $y);";
  }
  augment ET.bar(this.id, {int y = 0}) {
    log += "ET.bar($id, $y);";
  }
  augment ET.baz({required this.id, required int y}) {
    log += "ET.baz($id, $y);";
  }
}

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  C(1);
  checkLog("C(1, 0);C(1, 0);");
  C(1, 2);
  checkLog("C(1, 2);C(1, 2);");
  C.foo(1);
  checkLog("C.foo(1, 0);C.foo(1, 0);");
  C.foo(1, y: 2);
  checkLog("C.foo(1, 2);C.foo(1, 2);");
  C.bar(x: 1);
  checkLog("C.bar(1);C.bar(1);");

  ET.foo(1);
  checkLog("ET.foo(1, 0);ET.foo(1, 0);");
  ET.foo(1, 2);
  checkLog("ET.foo(1, 2);ET.foo(1, 2);");
  ET.bar(1);
  checkLog("ET.bar(1, 0);ET.bar(1, 0);");
  ET.bar(1, y: 2);
  checkLog("ET.bar(1, 2);ET.bar(1, 2);");
  ET.baz(id: 1, y: 1);
  checkLog("ET.baz(1, 2);ET.baz(1, 2);",);
}

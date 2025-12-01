// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete top-level function may be augmented,
/// and that its body can be added by the augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String topLevelFunction1();

augment String topLevelFunction1() {
  return "augmented";
}

String topLevelFunction2(String v);

augment String topLevelFunction2(String v) => v;

String topLevelFunction3(String v1, [String v2 = "v2 def"]);

augment String topLevelFunction3(String v1, [String v2]) {
  return "$v1;$v2";
}

augment String topLevelFunction4(String v1, {String v2 = "v2 def"});

String topLevelFunction4(String v1, {String v2}) {
  return "$v1;$v2";
}

String topLevelFunction5(String v1, {required String v2});

augment String topLevelFunction5(String v1, {required String v2}) => "$v1;$v2";

main() {
  Expect.equals("augmented", topLevelFunction1());
  Expect.equals("A", topLevelFunction2("A"));
  Expect.equals("B;v2 def", topLevelFunction3("B"));
  Expect.equals("B;C", topLevelFunction3("B", "C"));
  Expect.equals("D;v2 def", topLevelFunction4("D", v2: "E"));
  Expect.equals("D;E", topLevelFunction4("D", v2: "E"));
  Expect.equals("F,G", topLevelFunction5("F", v2: "G"));
}

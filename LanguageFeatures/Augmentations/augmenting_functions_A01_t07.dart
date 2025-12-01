// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete instance method may be augmented, and
/// that its body can be added by the augmentation. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  String instanceMethod1();
  String instanceMethod2(String v);
  String instanceMethod3(String v1, [String v2 = "v2 def"]);
  String instanceMethod4(String v1, {String v2 = "v2 def"});
  String instanceMethod5(String v1, {required String v2});
}

augment class C {
  augment String instanceMethod1() {
    return "augmented";
  }

  augment String instanceMethod2(String v) => v;

  augment String instanceMethod3(String v1, [String v2 = "v2 def"]) =>
      "$v1,$v2";

  augment String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    return "$v1,$v2";
  }

  augment String instanceMethod5(String v1, {required String v2}) {
    return "$v1,$v2";
  }
}

main() {
  C c = C();
  Expect.equals("augmented", c.instanceMethod1());
  Expect.equals("A;v2 def", c.instanceMethod2("A"));
  Expect.equals("B,v2 def", c.instanceMethod3("B"));
  Expect.equals("B,C", c.instanceMethod3("B", "C"));
  Expect.equals("D;v2 def", c.instanceMethod4("D"));
  Expect.equals("D;E", c.instanceMethod4("D", v2: "E"));
  Expect.equals("F;G", c.instanceMethod5("F", v2: "G"));
}

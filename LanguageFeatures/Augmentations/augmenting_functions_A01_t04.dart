// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete static method may be augmented, and
/// that its body can be added by the augmentation. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

enum E {
  e0;
  static String staticMethod1();
  static String staticMethod2(String v);
  static String staticMethod3(String v1, [String v2 = "v2 def"]);
  static String staticMethod4(String v1, {String v2 = "v2 def"});
  static String staticMethod5(String v1, {required String v2});
}

augment enum E {
  ;
  augment static String staticMethod1() {
    return "augmented";
  }

  augment static String staticMethod2(String v) => v;

  augment static String staticMethod3(String v1, [String v2 = "v2 def"]) =>
      "$v1,$v2";

  augment static String staticMethod4(String v1, {String v2 = "v2 def"}) {
    return "$v1,$v2";
  }

  augment static String staticMethod5(String v1, {required String v2}) {
    return "$v1,$v2";
  }
}

main() {
  Expect.equals("augmented", E.staticMethod1());
  Expect.equals("A;v2 def", E.staticMethod2("A"));
  Expect.equals("B,v2 def", E.staticMethod3("B"));
  Expect.equals("B,C", E.staticMethod3("B", "C"));
  Expect.equals("D;v2 def", E.staticMethod4("D"));
  Expect.equals("D;E", E.staticMethod4("D", v2: "E"));
  Expect.equals("F;G", E.staticMethod5("F", v2: "G"));
}

// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete function may be augmented by `async`
/// function and that its body can be added by the augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

Future<String> topLevelFunction();
augment Future<String> topLevelFunction() async => "augmented";

class C {
  static Future<String> staticMethod();
  Future<String> instanceMethod();
}

augment class C {
  augment static Future<String> staticMethod() async => "augmented";
  augment Future<String> instanceMethod() async => "augmented";
}

mixin M {
  static Future<String> staticMethod();
  Future<String> instanceMethod();
}

augment mixin M {
  augment static Future<String> staticMethod() async => "augmented";
  augment Future<String> instanceMethod() async => "augmented";
}

enum E {
  e0;
  static Future<String> staticMethod();
  Future<String> instanceMethod();
}

augment enum E {
  ;
  augment static Future<String> staticMethod() async => "augmented";
  augment Future<String> instanceMethod() async => "augmented";
}

class A {}

extension Ext on A {
  static Future<String> staticMethod();
  Future<String> instanceMethod();
}

augment extension Ext {
  augment static Future<String> staticMethod() async => "augmented";
  augment Future<String> instanceMethod() async => "augmented";
}

extension type ET(int _) {
  static Future<String> staticMethod();
  Future<String> instanceMethod();
}

augment extension type ET {
  augment static Future<String> staticMethod() async => "augmented";
  augment Future<String> instanceMethod() async => "augmented";
}

class MA = Object with M;

main() async {
  Expect.equals("augmented", await topLevelFunction());
  Expect.equals("augmented", await C.staticMethod());
  Expect.equals("augmented", await C().instanceMethod());
  Expect.equals("augmented", await M.staticMethod());
  Expect.equals("augmented", await MA().instanceMethod());
  Expect.equals("augmented", await E.staticMethod());
  Expect.equals("augmented", await E.e0.instanceMethod());
  Expect.equals("augmented", await Ext.staticMethod());
  Expect.equals("augmented", await A().instanceMethod());
  Expect.equals("augmented", await ET.staticMethod());
  Expect.equals("augmented", await ET(0).instanceMethod());
}

// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
/// It is allowed to augment a complete declaration as long as the augmentation
/// itself is incomplete. This can be useful for an augmentation to add metadata.
///
/// @description Checks that a complete `async` function may be augmented by an
/// incomplete (abstract) function declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

Future<String> topLevelFunction() async => "intro";
augment Future<String> topLevelFunction();

class C {
  static Future<String> staticMethod() async => "intro";
  Future<String> instanceMethod() async => "intro";
}

augment class C {
  augment static Future<String> staticMethod();
  augment Future<String> instanceMethod();
}

mixin M {
  static Future<String> staticMethod() async => "intro";
  Future<String> instanceMethod() async => "intro";
}

augment mixin M {
  augment static Future<String> staticMethod();
  augment Future<String> instanceMethod();
}

enum E {
  e0;
  static Future<String> staticMethod() async => "intro";
  Future<String> instanceMethod() async => "intro";
}

augment enum E {
  ;
  augment static Future<String> staticMethod();
  augment Future<String> instanceMethod();
}

class A {}

extension Ext on A {
  static Future<String> staticMethod() async => "intro";
  Future<String> instanceMethod() async => "intro";
}

augment extension Ext {
  augment static Future<String> staticMethod();
  augment Future<String> instanceMethod();
}

extension type ET(int _) {
  static Future<String> staticMethod() async => "intro";
  Future<String> instanceMethod() async => "intro";
}

augment extension type ET {
  augment static Future<String> staticMethod();
  augment Future<String> instanceMethod();
}

class MA = Object with M;

main() async {
  Expect.equals("intro", await topLevelFunction());
  Expect.equals("intro", await C.staticMethod());
  Expect.equals("intro", await C().instanceMethod());
  Expect.equals("intro", await M.staticMethod());
  Expect.equals("intro", await MA().instanceMethod());
  Expect.equals("intro", await E.staticMethod());
  Expect.equals("intro", await E.e0.instanceMethod());
  Expect.equals("intro", await Ext.staticMethod());
  Expect.equals("intro", await A().instanceMethod());
  Expect.equals("intro", await ET.staticMethod());
  Expect.equals("intro", await ET(0).instanceMethod());
}

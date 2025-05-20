// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static and instance member namespaces for an augmented type
/// or extension declaration include the declarations of all members in the
/// introductory and augmenting declarations. Identifiers in the bodies of
/// members are resolved against that complete merged namespace. In other words,
/// augmentations are applied before identifiers inside members are resolved.
///
/// @description Checks that `name` is interpreted as `this.name` if it occurs
/// inside a scope where a `this` is available. Test a method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'scoping_A01_t08.dart';
import '../../Utils/expect.dart';

String baz() => "Global baz";
String qux() => "Global qux";

augment class C {
  static String baz() => "baz";
  String qux() => "qux";

  void testIntroductory() {
    Expect.equals("Global baz", baz());
    Expect.equals("qux", qux());
    Expect.equals("Global foo", foo());
    Expect.equals("Global bar", bar());
  }
}

augment mixin M {
  static String baz() => "baz";
  String qux() => "qux";

  void testIntroductory() {
    Expect.equals("Global baz", baz());
    Expect.equals("qux", qux());
    Expect.equals("Global foo", foo());
    Expect.equals("Global bar", bar());
  }
}

augment enum E {
  augment e0;
  static String baz() => "baz";
  String qux() => "qux";

  void testIntroductory() {
    Expect.equals("Global baz", baz());
    Expect.equals("qux", qux());
    Expect.equals("Global foo", foo());
    Expect.equals("Global bar", bar());
  }
}

augment extension Ext {
  static String baz() => "baz";
  String qux() => "qux";

  void testIntroductory() {
    Expect.equals("Global baz", baz());
    Expect.equals("qux", qux());
    Expect.equals("Global foo", foo());
    Expect.equals("Global bar", bar());
  }
}

augment extension type ET {
  static String baz() => "baz";
  String qux() => "qux";

  void testIntroductory() {
    Expect.equals("Global baz", baz());
    Expect.equals("qux", qux());
    Expect.equals("Global foo", foo());
    Expect.equals("Global bar", bar());
  }
}

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
/// inside a scope where a `this` is available. Test a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'scoping_A01_t06.dart';
import '../../Utils/expect.dart';

String get baz => "Global baz";
String get qux => "Global qux";

augment class C {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("baz", baz);
    Expect.equals("qux", qux);
    Expect.equals("foo", foo);
    Expect.equals("bar", bar);
  }
}

augment mixin M {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("baz", baz);
    Expect.equals("qux", qux);
    Expect.equals("foo", foo);
    Expect.equals("bar", bar);
  }
}

augment enum E {
  ;
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("baz", baz);
    Expect.equals("qux", qux);
    Expect.equals("foo", foo);
    Expect.equals("bar", bar);
  }
}

augment extension Ext {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("baz", baz);
    Expect.equals("qux", qux);
    Expect.equals("foo", foo);
    Expect.equals("bar", bar);
  }
}

augment extension type ET {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("baz", baz);
    Expect.equals("qux", qux);
    Expect.equals("foo", foo);
    Expect.equals("bar", bar);
  }
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static and instance member namespaces for an augmented type
/// or extension declaration include the declarations of all members in the
/// introductory and augmenting declarations. Identifiers in the bodies of
/// members are resolved against that complete merged namespace. In other words,
/// augmentations are applied before identifiers inside members are resolved.
///
/// @description Checks that it is possible to use `this.name` and
/// `TypeName.name` for referencing declarations in another introductory or
/// augmenting declaration. Test a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'scoping_A01_t02.dart';
import '../../Utils/expect.dart';

String get baz => "Should not be used!";
String get qux => "Should not be used!";

augment class C {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment mixin M {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment enum E {
  augment e0;
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment extension Ext {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment extension type ET {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

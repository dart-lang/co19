// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a member declaration needs to reference a static or instance
/// member declared in another clashingName or augmenting declaration of the
/// same type, it can use `this.name` for instance members an `TypeName.name`
/// for static members to be absolutely sure. Or it can rely on the default if
/// `name` is not in the lexical scope at all, in which case it’s interpreted as
/// `this.name` if it occurs inside a scope where a `this` is available.
///
/// @description Checks that `name` is interpreted as `this.name` if it occurs
/// inside a scope where a `this` is available. Test a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'scoping_A01_t06.dart';
import '../../Utils/expect.dart';

String get baz => "Global baz";
String get qux => "Global qux";

augment class C {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("Global foo", foo);
    Expect.equals("bar", bar);
  }
}

augment mixin M {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("Global foo", foo);
    Expect.equals("bar", bar);
  }
}

augment enum E {
  augment e0;
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("Global foo", foo);
    Expect.equals("bar", bar);
  }
}

augment extension Ext {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("Global foo", foo);
    Expect.equals("bar", bar);
  }
}

augment extension type ET {
  static String get baz => "baz";
  String get qux => "qux";

  void testIntroductory() {
    Expect.equals("Global foo", foo);
    Expect.equals("bar", bar);
  }
}

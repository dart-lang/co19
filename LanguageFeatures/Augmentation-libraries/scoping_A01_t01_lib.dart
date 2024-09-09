// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a member declaration needs to reference a static or instance
/// member declared in another introductory or augmenting declaration of the
/// same type, it can use `this.name` for instance members an `TypeName.name`
/// for static members to be absolutely sure. Or it can rely on the default if
/// `name` is not in the lexical scope at all, in which case it’s interpreted as
/// `this.name` if it occurs inside a scope where a `this` is available.
///
/// @description Checks that it is possible to use `this.name` and
/// `TypeName.name` for referencing declarations in another introductory or
/// augmenting declaration. Test a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'scoping_A01_t01.dart';
import '../../Utils/expect.dart';

const baz = "Should not be used!";
String qux = "Should not be used!";

augment class C {
  static const baz = "baz";
  String qux = "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment mixin M {
  static const baz = "baz";
  String qux = "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment enum E {
  augment e0;
  static const baz = "baz";
  final String qux = "qux";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("bar", this.bar);
  }
}

augment extension Ext {
  static const baz = "baz";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
  }
}

augment extension type ET {
  static const baz = "baz";

  void testIntroductory() {
    Expect.equals("foo", C.foo);
    Expect.equals("id", this.id);
  }
}

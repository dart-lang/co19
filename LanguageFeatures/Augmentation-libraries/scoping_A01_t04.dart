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
/// augmenting declaration. Test a method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'scoping_A01_t04_lib.dart';
import '../../Utils/expect.dart';

String foo() => "Should not be used!";
String bar() => "Should not be used!";

class C {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz());
    Expect.equals("qux", this.qux());
  }
}

mixin M {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz());
    Expect.equals("qux", this.qux());
  }
}

enum E {
  e0;
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz());
    Expect.equals("qux", this.qux());
  }
}

class A {}

extension Ext on A {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz());
    Expect.equals("qux", this.qux());
  }
}

extension type ET(String id) {
  static String foo() => "foo";
  String bar() => "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz());
    Expect.equals("qux", this.qux());
  }
}

class MA = Object with M;

main() {
  C().testAugmenting();
  C().testIntroductory();
  MA().testAugmenting();
  MA().testIntroductory();
  E.e0.testAugmenting();
  E.e0.testIntroductory();
  A().testAugmenting();
  A().testIntroductory();
  ET("id").testAugmenting();
  ET("id").testIntroductory();
}

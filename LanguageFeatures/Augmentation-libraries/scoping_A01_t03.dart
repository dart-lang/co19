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
/// augmenting declaration. Test a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'scoping_A01_t03_lib.dart';

String _log = "";

void set foo(String _) {
  _log = "Should not be used!";
}
void set bar(String _) {
  _log = "Should not be used!";
}

class C {
  static void set foo(String _) {
    _log = "foo";
  }
  void set bar(String _) {
    _log = "bar";
  }

  void testAugmenting() {
    C.baz = "";
    Expect.equals("baz", _log);
    this.qux = "";
    Expect.equals("qux", _log);
  }
}

mixin M {
  static void set foo(String _) {
    _log = "foo";
  }
  void set bar(String _) {
    _log = "bar";
  }

  void testAugmenting() {
    C.baz = "";
    Expect.equals("baz", _log);
    this.qux = "";
    Expect.equals("qux", _log);
  }
}

enum E {
  e0;
  static void set foo(String _) {
    _log = "foo";
  }
  void set bar(String _) {
    _log = "bar";
  }

  void testAugmenting() {
    C.baz = "";
    Expect.equals("baz", _log);
    this.qux = "";
    Expect.equals("qux", _log);
  }
}

class A {}

extension Ext on A {
  static void set foo(String _) {
    _log = "foo";
  }
  void set bar(String _) {
    _log = "bar";
  }

  void testAugmenting() {
    C.baz = "";
    Expect.equals("baz", _log);
    this.qux = "";
    Expect.equals("qux", _log);
  }
}

extension type ET(String id) {
  static void set foo(String _) {
    _log = "foo";
  }
  void set bar(String _) {
    _log = "bar";
  }

  void testAugmenting() {
    C.baz = "";
    Expect.equals("baz", _log);
    this.qux = "";
    Expect.equals("qux", _log);
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

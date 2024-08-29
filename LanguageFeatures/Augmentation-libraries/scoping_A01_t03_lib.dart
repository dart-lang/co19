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

augment library 'scoping_A01_t03.dart';
import '../../Utils/expect.dart';

void set baz(String _) {
  _log = "Should not be used!";
}
void set qux(String _) {
  _log = "Should not be used!";
}

augment class C {
  static void set baz(String _) {
    _log = "Should not be used!";
  }
  void set qux(String _) {
    _log = "Should not be used!";
  }

  void testIntroductory() {
    C.foo = "";
    Expect.equals("foo", _log);
    this.bar = "";
    Expect.equals("bar", _log);
  }
}

augment mixin M {
  static void set baz(String _) {
    _log = "Should not be used!";
  }
  void set qux(String _) {
    _log = "Should not be used!";
  }

  void testIntroductory() {
    C.foo = "";
    Expect.equals("foo", _log);
    this.bar = "";
    Expect.equals("bar", _log);
  }
}

augment enum E {
  augment e0;
  static void set baz(String _) {
    _log = "Should not be used!";
  }
  void set qux(String _) {
    _log = "Should not be used!";
  }

  void testIntroductory() {
    C.foo = "";
    Expect.equals("foo", _log);
    this.bar = "";
    Expect.equals("bar", _log);
  }
}

augment extension Ext {
  static void set baz(String _) {
    _log = "Should not be used!";
  }
  void set qux(String _) {
    _log = "Should not be used!";
  }

  void testIntroductory() {
    C.foo = "";
    Expect.equals("foo", _log);
    this.bar = "";
    Expect.equals("bar", _log);
  }
}

augment extension type ET {
  static void set baz(String _) {
    _log = "Should not be used!";
  }
  void set qux(String _) {
    _log = "Should not be used!";
  }

  void testIntroductory() {
    C.foo = "";
    Expect.equals("foo", _log);
    this.bar = "";
    Expect.equals("bar", _log);
  }
}

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
/// inside a scope where a `this` is available. Test a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'scoping_A01_t07.dart';
import '../../Utils/expect.dart';

void set baz(String _) {
  _log = "Global foo";
}
void set qux(String _) {
  _log = "Global bar";
}

augment class C {
  static void set baz(String _) {
    _log = "baz";
  }
  void set qux(String _) {
    _log = "qux";
  }

  void testIntroductory() {
    baz = "";
    Expect.equals("baz", _log);
    qux = "";
    Expect.equals("qux", _log);
    foo = "";
    Expect.equals("foo", _log);
    bar = "";
    Expect.equals("bar", _log);
  }
}

augment mixin M {
  static void set baz(String _) {
    _log = "baz";
  }
  void set qux(String _) {
    _log = "qux";
  }

  void testIntroductory() {
    baz = "";
    Expect.equals("baz", _log);
    qux = "";
    Expect.equals("qux", _log);
    foo = "";
    Expect.equals("foo", _log);
    bar = "";
    Expect.equals("bar", _log);
  }
}

augment enum E {
  augment e0;
  static void set baz(String _) {
    _log = "baz";
  }
  void set qux(String _) {
    _log = "qux";
  }

  void testIntroductory() {
    baz = "";
    Expect.equals("baz", _log);
    qux = "";
    Expect.equals("qux", _log);
    foo = "";
    Expect.equals("foo", _log);
    bar = "";
    Expect.equals("bar", _log);
  }
}

augment extension Ext {
  static void set baz(String _) {
    _log = "baz";
  }
  void set qux(String _) {
    _log = "qux";
  }

  void testIntroductory() {
    baz = "";
    Expect.equals("baz", _log);
    qux = "";
    Expect.equals("qux", _log);
    foo = "";
    Expect.equals("foo", _log);
    bar = "";
    Expect.equals("bar", _log);
  }
}

augment extension type ET {
  static void set baz(String _) {
    _log = "baz";
  }
  void set qux(String _) {
    _log = "qux";
  }

  void testIntroductory() {
    baz = "";
    Expect.equals("baz", _log);
    qux = "";
    Expect.equals("qux", _log);
    foo = "";
    Expect.equals("foo", _log);
    bar = "";
    Expect.equals("bar", _log);
  }
}

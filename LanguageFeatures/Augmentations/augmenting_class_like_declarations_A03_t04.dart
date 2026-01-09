// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the augmenting
/// type, including enum values, are added to the instance or static namespace
/// of the corresponding type in the introductory declaration. In other words,
/// the augmentation can add new members to an existing type.
///
/// @description Checks that static members defined in the body of an
/// augmentation of a class, mixin, extension, enum or extension type are added
/// to the static namespace of the corresponding introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String _log = "";

class A {}

class C {}

augment class C {
  static String method() => "C";
  static String get getter => "get C";
  static void set setter(String v) {
    _log = "set C";
  }
}

mixin M {}

augment mixin M {
  static String method() => "M";
  static String get getter => "get M";
  static void set setter(String v) {
    _log = "set M";
  }
}

enum E {e1;}

augment enum E {
  ;
  static String method() => "E";
  static String get getter => "get E";
  static void set setter(String v) {
    _log = "set E";
  }
}

extension ExtA on A {}

augment extension ExtA {
  static String method() => "ExtA";
  static String get getter => "get ExtA";
  static void set setter(String v) {
    _log = "set ExtA";
  }
}

extension type ET(int id) {}

augment extension type ET {
  static String method() => "ET";
  static String get getter => "get ET";
  static void set setter(String v) {
    _log = "set ET";
  }
}

main() {
  Expect.equals("C", C.method());
  Expect.equals("get C", C.getter);
  C.setter = "set C";
  Expect.equals("set C", _log);

  Expect.equals("M", M.method());
  Expect.equals("M", M.getter);
  M.setter = "set M";
  Expect.equals("set M", _log);

  Expect.equals("E", E.method());
  Expect.equals("get E", E.getter);
  E.setter = "set E";
  Expect.equals("set E", _log);

  Expect.equals("ExtA", ExtA.method());
  Expect.equals("get ExtA", ExtA.getter);
  ExtA.setter = "set ExtA";
  Expect.equals("set ExtA", _log);

  Expect.equals("ET", ET(0).method());
  Expect.equals("get ET", ET(0).getter);
  ExtA.setter = "set ET";
  Expect.equals("set ET", _log);
}

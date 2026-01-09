// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the augmenting
/// type, including enum values, are added to the instance or static namespace
/// of the corresponding type in the introductory declaration. In other words,
/// the augmentation can add new members to an existing type.
///
/// @description Checks that instance members defined in the body of an
/// augmentation of a class, mixin, extension, enum or extension type are added
/// to the corresponding introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String _log = "";

class A {}

class C {}

augment class C {
  String method() => "C";
  String get getter => "get C";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

mixin M {}

augment mixin M {
  String method() => "M";
  String get getter => "get M";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

enum E {e1;}

augment enum E {
  ;
  String method() => "E";
  String get getter => "get E";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

extension ExtA on A {}

augment extension ExtA {
  String method() => "ExtA";
  String get getter => "get ExtA";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

extension type ET(int id) {}

augment extension type ET {
  String method() => "ET";
  String get getter => "get ET";
  void set setter(String v) {
    _log = v;
  }
  int operator +(int other) => other;
}

class MA = Object with M;

main() {
  Expect.equals("C", C().method());
  Expect.equals("get C", C().getter);
  C().setter = "set C";
  Expect.equals("set C", _log);
  Expect.equals(1, C() + 1);

  Expect.equals("M", MA().method());
  Expect.equals("M", MA().getter);
  MA().setter = "set M";
  Expect.equals("set M", _log);
  Expect.equals(2, MA() + 2);

  Expect.equals("E", E.e1.method());
  Expect.equals("get E", E.e1.getter);
  E.e1.setter = "set E";
  Expect.equals("set E", _log);
  Expect.equals(3, E.e1 + 3);

  Expect.equals("ExtA", A().method());
  Expect.equals("get ExtA", A().getter);
  A().setter = "set ExtA";
  Expect.equals("set ExtA", _log);
  Expect.equals(4, A() + 4);

  Expect.equals("ET", ET(0).method());
  Expect.equals("get ET", ET(0).getter);
  ET(0).setter = "set ET";
  Expect.equals("set ET", _log);
  Expect.equals(5, ET(42) + 5);
}

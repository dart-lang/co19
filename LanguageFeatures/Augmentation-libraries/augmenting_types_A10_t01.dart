// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that instance members defined in the body of an augment
/// of a class, mixin, extension, enum or extension type are added to the
/// interface of the corresponding type in the augmented library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class A {}

class C {}

mixin M {}

enum E {e1;}

extension ExtA on A {}

extension type ET(int id) {}

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
  ET().setter = "set ET";
  Expect.equals("set ET", _log);
  Expect.equals(5, ET(42) + 5);
}

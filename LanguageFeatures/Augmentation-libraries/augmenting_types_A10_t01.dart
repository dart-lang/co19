// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that instance members defined in the body of an augment
/// of a class, mixin or enum are added to an instance namespace of the
/// corresponding type in the augmented library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class C {}

mixin M {}

enum E {e1;}

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
  Expect.equals(3, E.e1 + 1);
}

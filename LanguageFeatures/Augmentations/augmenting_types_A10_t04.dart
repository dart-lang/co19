// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that static members defined in the body of an augment of
/// a class, mixin, extension, enum or extension type are added to a static
/// namespace of the corresponding type in the augmented library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_types_A10_t04_lib.dart';

String _log = "";

class A {}

class C {}

mixin M {}

enum E {e1;}

extension ExtA on A {}

extension type ET(int id) {}

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

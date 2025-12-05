// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is not an error if an augmenting constructor
/// specifies default values for optional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C([int x]);
  C.c1({int x});
}

augment class C {
  augment C([int x = 1]) : x = x;
  augment C.c1({int x = 2}) : x = x;
}

enum E {
  e0, e1.c1();

  final int x;
  const E([int x]);
  const E.c1({int x});
}

augment enum E {
  ;
  augment const E([int x = 1]) : x = x;
  augment const E.c1({int x = 2}) : x = x;
}

String log = "";

extension type ET(int id) {
  ET.c1(this.id, [int x]);
  ET.c2(this.id, {int x});
}

augment extension type ET {
  augment ET.c1(this.id, [int x = 1]) : assert(() {
    log = "$x";
    return true;
  }());
  augment ET.c2(this.id, {int x = 2})  assert(() {
    log = "$x";
    return true;
  }());
}

main() {
  Expect.equals(1, C().x);
  Expect.equals(2, C.c1().x);
  Expect.equals(1, E.e0.x);
  Expect.equals(2, E.e1.x);
  ET.c1(0);
  if (assertStatementsEnabled) {
    Expect.equals("1", log);
  }
  ET.c2(0);
  if (assertStatementsEnabled) {
    Expect.equals("2", log);
  }
}

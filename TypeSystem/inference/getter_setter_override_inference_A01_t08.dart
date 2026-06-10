// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter, parameter type of a setter or type
/// of a field which overrides/implements only one or more getters is inferred
/// to be the return type of the combined member signature of said getter in the
/// direct superinterfaces.
///
/// @description Checks that with an extension, the return type of a
/// getter/field or parameter type of a setter are not inferred form the on-type
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class A {
  num get m1 => 3.14;
  num get m2 => 3.14;
}

extension Ext on A {
  get m1 => 0;
  void set m2(v) {
    Expect.throws(() {
      v.checkDynamic;
    });
  }
}

main() {
  Expect.throws(() {
    Ext(A()).m1.checkDynamic;
  });
  Ext(A()).m2 = 'x';
}

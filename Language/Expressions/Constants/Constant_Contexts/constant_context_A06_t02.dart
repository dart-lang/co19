// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant context is introduced in situations where an
/// expression is required to be constant. This is used to allow the const
/// modifier to be omitted in cases where it does not contribute any new
/// information.
///
/// @description Checks that `when` part of a guard pattern is not a constant
/// context
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  final val;
  const C(this.val);
}

const c1 = C(1);

bool test(bool b) => switch(b) {
  true when identical(c1, C(1)) => true,
  _ => false
};

main() {
  bool wasTrue = false;

  if (2 > 1 case true when identical(c1, C(1))) {
    wasTrue = true;
  }
  Expect.isFalse(wasTrue);

  switch (true) {
    case true when identical(c1, C(1)):
      wasTrue = true;
    default:
  }
  Expect.isFalse(wasTrue);
  Expect.isFalse(test(true));
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `num.parse()/tryParse()`, `int.parse()/tryParse()` and
/// `double.parse()/tryParse()` don't accept separators.
///
/// @description Check that it is a run-time error if string, parsed by
/// `num.parse()/tryParse()` contains `_`.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

main() {
  Expect.throws(() {
    num.parse("+1_2");
  });
  Expect.throws(() {
    num.parse("+3__4");
  });
  Expect.throws(() {
    num.parse("+0x5_6");
  });
  Expect.throws(() {
    num.parse("+0x7__8");
  });

  Expect.throws(() {
    num.parse("+5_6.7_8");
  });
  Expect.throws(() {
    num.parse("+9__0.1__2");
  });
  Expect.throws(() {
    num.parse("+1.2e1_0");
  });
  Expect.throws(() {
    num.parse("+1.2_3e+1");
  });
  Expect.throws(() {
    num.parse("+1_2.3e-1");
  });

  Expect.isNull(num.tryParse("+1_2"));
  Expect.isNull(num.tryParse("+3__4"));
  Expect.isNull(num.tryParse("+0x5_6"));
  Expect.isNull(num.tryParse("+0x7__8"));

  Expect.isNull(num.tryParse("+1_2"));
  Expect.isNull(num.tryParse("+3__4"));
  Expect.isNull(num.tryParse("+5_6.7_8"));
  Expect.isNull(num.tryParse("+9__0.1__2"));
  Expect.isNull(num.tryParse("+1.2e1_0"));
  Expect.isNull(num.tryParse("+1.2_3e+1"));
  Expect.isNull(num.tryParse("+1_2.3e-1"));
}

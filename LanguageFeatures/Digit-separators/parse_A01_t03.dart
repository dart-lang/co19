// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `num.parse()/tryParse()`, `int.parse()/tryParse()` and
/// `double.parse()/tryParse()` don't accept separators.
///
/// @description Check that it is a run-time error if string, parsed by
/// `int.parse()/tryParse()` contains `_`.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

main() {
  Expect.throws(() {
    int.parse("-1_2");
  });
  Expect.throws(() {
    int.parse("-3__4");
  });
  Expect.throws(() {
    int.parse("-0x5_6", radix: 16);
  });
  Expect.throws(() {
    int.parse("-0x7__8", radix: 16);
  });
  Expect.isNull(int.tryParse("-1_2"));
  Expect.isNull(int.tryParse("-3__4"));
  Expect.isNull(int.tryParse("-0x5_6", radix: 16));
  Expect.isNull(int.tryParse("-0x7__8", radix: 16));
}

// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion N/A
/// @description Checks that triple right shift argument cannot be negative
/// (see co19 Issue #355 for more details)
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";

main() {
  int i1 = 12345;
  int i2 = -11;
  int i3 = -12345;

  Expect.throws(() { i1 >>> i2; });
  Expect.throws(() { i1 >>> i3; });
  Expect.throws(() { i2 >>> i3; });
  Expect.throws(() { i3 >>> i2; });
  Expect.throws(() { i1 >>> -2; });
  Expect.throws(() { 2000 >>> i3; });
  Expect.throws(() { 150 >>> -14; });
}

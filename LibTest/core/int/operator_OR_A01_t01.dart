// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This operator implements a bit-wise OR operation.
/// @description Checks that this operator returns correct value.
/// @author vasya

import "../../../Utils/expect.dart";

void main() {
  Expect.equals(0, 0 | 0);
  Expect.equals(1, 0 | 1);
  Expect.equals(1, 1 | 0);
  Expect.equals(1, 1 | 1);    

  Expect.equals(27, 25 | 3);
  Expect.equals(15, 15 | 9);
  
  Expect.equals(3, 3 | 3);
  Expect.equals(3, 3 | 2);
  Expect.equals(3, 1 | 2);
  Expect.equals(3, 0 | 3);
  if (!isJS) {
    Expect.equals(0x180000000, 0x100000000 | 0x80000000);
    Expect.equals(0x7ffffffffffff, 0x7ffffffffffff | 400000000000000);
  }
}

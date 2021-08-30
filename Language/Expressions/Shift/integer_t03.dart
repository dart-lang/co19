// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion N/A
/// @description Checks that triple right shift works with integers as expected
/// @author iarkh@unipro.ru


import '../../../Utils/expect.dart';

main() {
  int i = 1;
  Expect.equals(0, i >>> 1);
  Expect.equals(0, i >>> 2);
  Expect.equals(0, i >>> 64);
  Expect.equals(0, i >>> 100);

  int j = 0x7FFFFFFFFFFFF000;
  if (!isJS) {
    Expect.equals(4611686018427385856, j >>> 1);
    Expect.equals(2305843009213692928, j >>> 2);
    Expect.equals(1152921504606846464, j >>> 3);
  }
  int k = 129;
  Expect.equals(0, k >>> 261);

  int l = 1295555555;
  Expect.equals(l, l >>> 0);
}

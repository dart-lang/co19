/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> bytes)
 * Appends bytes to the current contents of the builder.
 * Each value of bytes will be bit-representation truncated to the range
 * 0 .. 255.
 * @description Checks that each int value in the [bytes] list is truncated
 * to range 0 .. 255
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();

  builder.add([1000, 2000, 3000]);
  builder.add([-400000, -5500000, -99900000]);
  List<int> expected = [1000, 2000, 3000, -400000, -5500000, -99900000]
      .map((int e) => e & 255).toList();
  Expect.listEquals(expected, builder.toBytes());

  builder.add([0,1,-2,-3]);
  Expect.listEquals(expected..addAll([0,1,254,253]), builder.toBytes());
}

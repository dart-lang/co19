/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(List<int> bytes)
 * Convert a list of bytes using the options given to the ZLibEncoder
 * constructor.
 * @description Checks that the the convert method works correctly.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var v1 = new ZLibEncoder();
  var l1 = [1, 2, 3, 4, 5, 6];
  var v2 = new ZLibDecoder();

  var l2 = v1.convert(l1);
  Expect.isFalse(l1[0] == l2[0]);

  var l3 = v2.convert(l2);
  Expect.listEquals(l1, l3);
}

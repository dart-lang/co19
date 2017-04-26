/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32List.fromList(List<double> elements)
 * Creates a [Float32List] with the same length as the [elements] list
 * and copies over the elements.
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that a new [Float32List] has the same size and some
 * elements may be truncated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {

  List<double> list = [1.0, 1.0000000000000002, 1.0000000000000004];
  Float32List l = new Float32List.fromList(list);
  Expect.equals(list.length, l.length);
  Expect.equals(list[0], l[0]);
  Expect.notEquals(list[1], l[1]);
  Expect.notEquals(list[2], l[2]);
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, E value)
 * ...
 * or throws a RangeError if index is out of bounds.
 * @description Checks that an exception is thrown as expected.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  try {
    l[-1] = new Float32x4.zero();
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[l.length] = new Float32x4.zero();
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x80000000] = new Float32x4.zero();
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x7fffffff] = new Float32x4.zero();
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check([]);
  check([pack(1.0)]);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0), pack(12.0),
    pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0), pack(18.0),
    pack(19.0), pack(20.0)
  ]);
}

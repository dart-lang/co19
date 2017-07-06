/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setRange(
 *     int start,
 *     int end,
 *     Iterable<E> iterable, [
 *     int skipCount = 0
 * ])
 * ...
 * The provide range, given by [start] and [end], must be valid. A range from
 * [start] to [end] is valid if 0 <= start <= end <= len, where len is [this]
 * list's length.
 * @description Checks that it is an error if [start]..[end] is not a valid
 * range pointing into the [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List(10);

  Expect.throws(() {
    l.setRange(10, 1, [
      pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
      pack(7.0), pack(8.0), pack(9.0), pack(10.0)]);
  });

  Expect.throws(() {
    l.setRange(-1, 1, [
      pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
      pack(7.0), pack(8.0), pack(9.0), pack(10.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(1, 100, [
      pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
      pack(7.0), pack(8.0), pack(9.0), pack(10.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(-2147483648, 2147483647, [
      pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
      pack(7.0), pack(8.0), pack(9.0), pack(10.0)
    ]);
  });
}

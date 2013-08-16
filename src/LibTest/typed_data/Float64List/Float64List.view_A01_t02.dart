/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Creates an [Float64List] _view_ of the specified region in
 * the specified byte buffer.
 * @description Checks that a new instance has the same elements as
 * the specified region.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(array, offset, length) {
  var tmp = new Float64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float64List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  for(int i = 0; i < l.length; ++i) {
    Expect.equals(tmp[offset ~/ Float64List.BYTES_PER_ELEMENT + i], l[i]);
  }
}

checkIntersection(array, offset, length, expected) {
  var tmp = new Uint64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float64List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  Expect.listEquals(expected, l);
}

main() {
  check([], 0, 0);
  check([1.0], 0, 1);
  check([1.7976931348623157e308, 4.9e-324], 0, 2);
  check([1000.0, 1000.0, 1000.0], 0, 3);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 0, 18);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 40, 13);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0], 136, 1);

  checkIntersection([1, 1], 1, 1, [7.291122019556398e-304]);
  checkIntersection([0xab08621ac76ff745, 0x76b8abbc876ca730, 0x6347cf7d6e8a8c87, 0x7fed09d60129c0ff, 0x87ac6fe8346312cb], 3, 4,
  [2.4982144792687325e+215, -7.422028841878461e-258, 1.447502700187904e-107, 1.773283116709528e+169]);
  checkIntersection([0xab08621ac76ff745, 0x76b8abbc876ca730, 0x6347cf7d6e8a8c87, 0x7fed09d60129c0ff, 0x87ac6fe8346312cb], 2, 4,
  [-6.454873639165948e-120, -2.6217489798095923e-248, -128564.48815673045, 3.8951239011375936e-218]);
}

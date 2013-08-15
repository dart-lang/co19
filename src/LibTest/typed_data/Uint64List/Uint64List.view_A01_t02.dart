/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint64List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Creates an [Uint64List] _view_ of the specified region in
 * the specified byte buffer.
 * @description Checks that a new instance has the same elements as
 * the specified region.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(array, offset, length) {
  var tmp = new Uint64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint64List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  for(int i = 0; i < l.length; ++i) {
    Expect.equals(tmp[offset ~/ Uint64List.BYTES_PER_ELEMENT + i], l[i]);
  }
}

checkIntersection(array, offset, length, expected) {
  var tmp = new Uint64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint64List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  Expect.listEquals(expected, l);
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([18446744073709551615, 9223372036854775808], 0, 2);
  check([1000, 1000, 1000], 0, 3);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 40, 13);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 136, 1);

  checkIntersection([1, 1], 1, 1, [72057594037927936]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  3, 4, [13593887511379658085, 15549952556606967927, 11313323065863868285, 7138992109640896668]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  2, 4, [12047317055796766202, 14737878643830192060, 71885288750677463, 1354316770823937181]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  4, 4, [8627954813604751173, 9067941256915237968, 11285177338142788751, 17970227603372340816]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  5, 4, [5798310471524878439, 10339657592958519996, 5808690247011355148, 12464102376099278198]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  6, 4, [13569477329409846024, 905080415927629450, 8525486292752884554, 7326504897737359341]);
  checkIntersection([0xab08674565fa3cb1, 0x768abc5077bca730, 0x634a0c8f7dd7cc87, 0x7fed76509c9d00ff, 0x87b165acf96312cb],
  7, 4, [9996953748052062379, 5335797429181384566, 17110952467819986787, 12782813304470031231]);
}

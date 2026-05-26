// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// ByteData.sublistView( TypedData data, [ int start = 0, int? end ])
/// ```
/// Creates a [ByteData] view on a range of elements of data.
///
/// Creates a view on the range of `data.buffer` which corresponds to the
/// elements of `data` from `start` until `end`. If `data` is a typed data list,
/// like [Uint16List], then the view is on the bytes of the elements with
/// indices from `start` until `end`. If `data` is a [ByteData], it's treated
/// like a list of bytes.
///
/// If provided, `start` and `end` must satisfy
///
/// 0 ≤ `start` ≤ `end` ≤ elementCount`
///
/// where elementCount is the number of elements in `data`, which is the same as
/// the [List.length] of a typed data list.
///
/// If omitted, `start` defaults to zero and `end` to elementCount.
///
/// @description Checks that this constructor creates a [ByteData] view on a
/// range of elements of `data`.
/// @author sgrekhov22@gmail.com

import 'dart:typed_data';
import '../../../Utils/expect.dart';

void test(List<int> array, int start, int? end, int? expected) {
  final typedData = Int8List.fromList(array);
  final bd = ByteData.sublistView(typedData, start, end);
  if (expected != null) {
    Expect.equals(expected, bd.getInt8(0));
  }
  Expect.listEquals(array, bd.buffer.asInt8List().toList());
}

main() {
  test([], 0, 0, null);
  test([127, -128], 0, 2, 127);
  test([127, -128], 1, 2, -128);
  test([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 5, 6, 5);
}

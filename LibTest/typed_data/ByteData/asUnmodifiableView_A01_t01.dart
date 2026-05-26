// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// ByteData asUnmodifiableView()
/// ```
/// A read-only view of this [ByteData].
///
/// @description Checks that this is a runtime error to modify [ByteData]
/// returned by this method.
/// @author sgrekhov22@gmail.com

import 'dart:typed_data';
import '../../../Utils/expect.dart';

void test(List<int> array) {
  final bd1 = ByteData.view(Int8List.fromList(array).buffer, 0);
  final bd2 = bd1.asUnmodifiableView();
  Expect.throws(() {
    bd2.setInt8(0, 42);
  });
  // Check that initial ByteData is still editable
  if (array.length > 0) {
    bd1.setInt8(0, 42);
  }
}

main() {
  test([]);
  test([0]);
  test([0, 1]);
}

// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int lengthInBytes
/// Returns the length of this view, in bytes.
/// @description Checks that [lengthInBytes] is read-only and can't be set.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(count) {
  dynamic l = new ByteData(count);
  Expect.throws(() { l.lengthInBytes = 0; }, (e) => e is NoSuchMethodError);
}

main() {
  check(0);
  check(5);
  check(100);
}

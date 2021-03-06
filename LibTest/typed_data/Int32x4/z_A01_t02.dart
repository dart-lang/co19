// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int z
/// Extracts 32-bit mask from z lane.
/// @description Checks that [z] is read-only and can't be set.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Int32x4(0, 0, 0, 0);
  Expect.throws(() { obj.z = 1; }, (e) => e is NoSuchMethodError);
}

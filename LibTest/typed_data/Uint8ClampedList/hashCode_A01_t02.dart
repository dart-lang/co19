// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int hashCode
/// The hash code for this object.
/// A hash code is a single integer which represents the state of the object that
/// affects == comparisons.
/// @description Checks that [hashCode] is read-only and can't be set.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic list = new Uint8ClampedList(0);
  Expect.throws(() { list.hashCode = 1; }, (e) => e is NoSuchMethodError);
}

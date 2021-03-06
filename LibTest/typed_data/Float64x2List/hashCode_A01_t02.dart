// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int hashCode
/// Get a hash code for this object.
/// All objects have hash codes. Hash codes are guaranteed to be the same for
/// objects that are equal when compared using the equality operator ==.
/// @description Checks that hashCode is read-only and cannot be set.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float64x2List(0);
  Expect.throws(() { obj.hashCode = 1; }, (e) => e is NoSuchMethodError);
}

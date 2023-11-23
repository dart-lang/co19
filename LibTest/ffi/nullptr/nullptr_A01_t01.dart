// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<Never> nullptr
/// final
/// Represents a pointer into the native C memory corresponding to 'NULL', e.g.
/// a pointer with address 0.
///
/// @description Checks that this property represents a pointer with address 0
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  Expect.equals(0, nullptr.address);
}

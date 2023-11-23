// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int sizeOf <T extends NativeType>()
///  Number of bytes used by native type T.
///
///  Includes padding and alignment of structs.
///
/// @description Checks that this function returns Number of bytes used by native
/// type T
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import '../../../Utils/expect.dart';

void main() {
  Expect.equals(1, sizeOf<Int8>());
  Expect.equals(2, sizeOf<Int16>());
  Expect.equals(4, sizeOf<Int32>());
  Expect.equals(8, sizeOf<Int64>());
  Expect.equals(8, sizeOf<Double>());
  Expect.equals(4, sizeOf<Float>());
  Expect.equals(1, sizeOf<Uint8>());
  Expect.equals(2, sizeOf<Uint16>());
  Expect.equals(4, sizeOf<Uint32>());
  Expect.equals(8, sizeOf<Uint64>());
}

// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int sizeOf <T extends NativeType>()
///  Number of bytes used by native type T.
///
///  Includes padding and alignment of structs.
///
/// @description Checks that this function throws an exception if T is unsized
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import '../../../Utils/expect.dart';

void main() {
  Expect.throws(() {
    sizeOf<Void>();
  });
}

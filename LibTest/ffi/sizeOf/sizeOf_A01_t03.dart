/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int sizeOf <T extends NativeType>()
 *  Number of bytes used by native type T.
 *
 *  This function must be invoked with a compile-time constant T.
 *
 * @description Checks that it is a compile error if T is not a constant
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";

void main() {
  sizeOf<Handle>();
//^^^^^^^^^^^^^^^^
// [unspecified]
// [unspecified]

  sizeOf<NativeType>();
//^^^^^^^^^^^^^^^^^^^^
// [unspecified]
// [unspecified]

  sizeOf<NativeFunction>();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [unspecified]
// [unspecified]
}

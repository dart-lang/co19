/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * const Array<T extends NativeType>(int dimension1)
 *  Const constructor to specify Array dimensions in Structs.
 *
 * @description Checks that this class represents a fixed-size array of Pointer
 * @author sgrekhov@unipro.ru
 * @issue 45198, 45200
 */
import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

class MyStruct extends Struct {
  @Array(2)
  external Array<Pointer<Int8>> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      Pointer<Int8> p1 = calloc<Int8>();
      try {
        array[i] = p1;
        Expect.equals(p1.address, array[i].address);
      } finally {
        calloc.free(p1);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}

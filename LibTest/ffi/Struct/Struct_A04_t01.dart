// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Struct()
///  The supertype of all FFI struct types.
///
///  FFI struct types should extend this class and declare fields corresponding
///  to the underlying native structure.
///
/// @description Checks that FFI struct types should extend this class and
/// declare fields corresponding to the underlying native structure. Test
/// incomplete data
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

final class Coord extends Struct {
  @Double()
  external double x;
  @Double()
  external double y;
  // Don't create field for Pointer to next
}

// Native C function
typedef TransposeCoordinateCFunc = Pointer<Coord> Function(Pointer<Coord>);
// Dart function
typedef TransposeCoordinateDartFunc = Pointer<Coord> Function(Pointer<Coord>);

void main() {
  final dl = new DynamicLibrary.open(libPath(TEST_FUNCTIONS_LIB));
  final TransposeCoordinateDartFunc f = dl
      .lookup<NativeFunction<TransposeCoordinateCFunc>>('TransposeCoordinate')
      .asFunction();
  Pointer<Coord> c1 = calloc<Coord>();
  try {
    c1.ref.x = 1;
    c1.ref.y = 2;
    f(c1);
    Expect.equals(11, c1.ref.x);
    Expect.equals(12, c1.ref.y);
  } finally {
    calloc.free(c1);
  }
}

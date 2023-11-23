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
/// that nullable Struct subtype members cause a compile-time error
/// @author sgrekhov@unipro.ru

import "dart:ffi";

final class Coord extends Struct {
  Coord() : super();

  @Double()
  external double? x;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  @Double()
  external double? y;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  external Pointer<Coord>? next;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(Coord);
}

// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>
///  Represents a pointer into the native C memory. Cannot be extended.
///
/// @description Checks that it is a compile time error if pointer class is a
/// top type
/// @author sgrekhov@unipro.ru
/// @issue 47746

import "dart:ffi";
import 'package:ffi/ffi.dart';

void main() {
  Pointer<Int16> p = calloc<Int16>();
  Pointer<dynamic> p1 = Pointer.fromAddress(p.address);
//        ^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<void> p2 = Pointer.fromAddress(p.address);
//        ^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<Null> p3 = Pointer.fromAddress(p.address);
//        ^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<Object?> p4 = Pointer.fromAddress(p.address);
//        ^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<Never> p5 = Pointer.fromAddress(p.address);
//        ^^^^^
// [cfe] unspecified
// [analyzer] unspecified
}

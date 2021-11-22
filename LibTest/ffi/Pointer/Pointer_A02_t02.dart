// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>
///  Represents a pointer into the native C memory. Cannot be extended.
///
/// @description Checks that it is a compile time error if pointer class is
/// not subtype of NativeType
/// @author sgrekhov@unipro.ru

import "dart:ffi";

import 'package:ffi/ffi.dart';

void main() {
  Pointer<Int16> p = calloc<Int16>();
  Pointer<int> p1 = Pointer.fromAddress(p.address);
//        ^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<double> p2 = Pointer.fromAddress(p.address);
//        ^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<String> p3 = Pointer.fromAddress(p.address);
//        ^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  Pointer<Object> p4 = Pointer.fromAddress(p.address);
//        ^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

}

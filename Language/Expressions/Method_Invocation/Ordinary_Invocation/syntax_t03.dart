// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An unconditional ordinary method invocation i has the form
/// o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
/// @description Checks that it is a compile-time error if named arguments
/// placed in between positional arguments.
/// @author msyabro

// @dart = 2.16

main() {
  var o;
  o.f(1, name: null, 1);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

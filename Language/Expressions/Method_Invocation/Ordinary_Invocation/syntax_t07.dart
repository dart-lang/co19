// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An unconditional ordinary method invocation i has the form
/// o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
/// @description Checks static invocations, when o denotes a class in the
/// current scope. It is a compile-time error if named arguments precede
/// positional arguments.
/// @author msyabro


class C {
  static f(p1, [name]) {}
}

main() {
  C.f(name: null, 1);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

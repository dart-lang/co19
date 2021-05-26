// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// getterSignature:
///   returnType? get identifier
/// ;
/// @description Checks that a compile-time error is produced if an arbitrary 
/// instance getter specifies a single formal parameter.
/// @author vasya


class C {
  get getter(var value) { throw new C(); }
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    var x = new C().getter;
  } catch (e) {}
}

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile time error if the type argument of a
/// constant map literal includes a type parameter.
/// @description Checks that it is an error if the type argument of a
/// constant map literal includes a type variable.
/// @issue 27492
/// @author msyabro


class C<T> {
  test() {
    const <String, T> {};
//                 ^
// [analyzer]unspecified
// [cfe]unspecified
  }
}

main() {
  new C<int>().test();
}

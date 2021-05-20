// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the key of an entry in a constant
/// map literal is an instance of a class that implements the operator == unless
/// the key is a string or integer, a literal symbol or the result of invoking a
/// constant constructor of class Symbol.
/// @description Checks that compile-error is produced for const
/// Map<dynamic,dynamic> literal that contains a non-string, non-integer key
/// whose class implements operator ==.
/// @author ilya


class C {
  const C();
  bool operator ==(other) => true;
}

main() {
  var x = const {const C(): 1};
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

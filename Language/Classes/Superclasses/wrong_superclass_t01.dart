// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the type in the extends clause of a
/// class C is a type variable, a type alias that does not denote a class, an
/// enumerated type, a deferred type, type dynamic, or type FutureOr<T> for any
/// T.
///
/// @description Checks that it is a compile-time error if a type expression in
/// a class's `extends` clause denotes an unavailable type.
/// @author pagolubev

class A extends Unavailable {}
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}

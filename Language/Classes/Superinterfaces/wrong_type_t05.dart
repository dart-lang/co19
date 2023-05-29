// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an element in the type list of the
/// implements clause of a class C is a type variable, a type alias that does
/// not denote a class, an enumerated type, a deferred type, type dynamic, or
/// type FutureOr<T> for any T.
///
/// @description Checks that it is a compile-time error when the type expression
/// in a class's implements clause denotes a deferred type
/// @author sgrekhov@unipro.ru
/// @issue 42031

import "wrong_type_lib.dart" deferred as d;

class C implements d.A {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}

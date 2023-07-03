// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an element in the type list of the
/// with clause of a mixin application is a type variable, a function type, a
/// type alias that does not denote a class, an enumerated type, a deferred
/// type, type dynamic, type void, or type FutureOr<T> for any T
///
/// @description Checks that it is a compile-time error when `with` clause
/// includes a deferred type expression. Test type alias
/// @author sgrekhov@unipro.ru
/// @issue 42031

import 'deferred_lib.dart' deferred as d;

class B {
}

class C = B with d.AAlias {}
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}

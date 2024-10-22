// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is not an error if a parametrized super-bounded
/// type is used in a constant `as` expression and a top type.
/// @Issue 42415, 42429
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  var b1 = null as A?;

  var b2 = null as A<dynamic>?;
  var b3 = null as A<Object?>?;

  var b5 = null as A<Never>?;
  var b6 = null as A<void>?;

  var b7  = null as A<A>?;
  var b8  = null as A<A<dynamic>>?;
  var b9  = null as A<A<Object?>>?;

  var b11 = null as A<A<Never>>?;
  var b12 = null as A<A<void>>?;
}

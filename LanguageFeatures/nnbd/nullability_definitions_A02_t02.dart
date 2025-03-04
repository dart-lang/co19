// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is non-nullable if T <: Object. This is
/// equivalent to the syntactic criterion that T is any of:
///  Never
///  Any function type (including Function)
///  Any interface type except Null.
///  S* for some S where S is non-nullable
///  FutureOr<S> where S is non-nullable
///  X extends S where S is non-nullable
///  X & S where S is non-nullable
///
/// @description Check that type which is not subtype of Object cannot be
/// assigned to non-nullable type. Test function type
/// @author sgrekhov@unipro.ru

void foo() {}
typedef void bar(int i);

main() {
  var f1 = foo;
  f1 = null;
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar f2 = null;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Function f3 = (int i) => i;
  f3 = null;
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

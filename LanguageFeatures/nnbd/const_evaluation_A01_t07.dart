// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With sound null safety, all generic const constructors and
/// generic const literals are evaluated using the actual type arguments
/// provided, whether legacy or non-legacy. This ensures that with sound null
/// safety, the final consistent semantics are obeyed.
///
/// @description Checks statically that actual generic class type parameter is
/// evaluated correctly for [FutureOr] type argument.
///
/// @author iarkh@unipro.ru

import "dart:async";

class A<T> {
  const A();
}

main() {
  const A<int?> a1 = A<FutureOr>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<int > a2 = A<FutureOr>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Object?> a3 = A<FutureOr>();
  const A<Object > a4 = A<FutureOr>();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function?> a5 = A<FutureOr>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function > a6 = A<FutureOr>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<dynamic> a7 = A<FutureOr>();

  const A<Null> a8 = A<FutureOr>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<void> a9 = A<FutureOr>();

  const A<Never> a10 = A<FutureOr>();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<FutureOr> a11 = A<FutureOr>();
}

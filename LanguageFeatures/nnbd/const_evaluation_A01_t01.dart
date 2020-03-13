/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In strong checking mode, all generic const constructors and
 * generic const literals are evaluated using the actual type arguments
 * provided, whether legacy or non-legacy. This ensures that in strong checking
 * mode, the final consistent semantics are obeyed.
 *
 * @description Checks statically that actual generic class type parameter is
 * evaluated correctly for [int?] type argument.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "dart:async";

class A<T> {
  const A();
}

main() {
  const A<int?> a1 = A<int?>();
  const A<int > a2 = A<int?>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Object?> a3 = A<int?>();
  const A<Object > a4 = A<int?>();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function?> a5 = A<int?>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function > a6 = A<int?>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<dynamic> a7 = A<int?>();

  const A<Null> a8 = A<int?>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<void> a9 = A<int?>();

  const A<Never> a10 = A<int?>();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<FutureOr> a11 = A<int?>();
}

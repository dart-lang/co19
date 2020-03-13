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
 * evaluated correctly for [dynamic] type argument.
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
  const A<int?> a1 = A<dynamic>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<int > a2 = A<dynamic>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Object?> a3 = A<dynamic>();
  const A<Object > a4 = A<dynamic>();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function?> a5 = A<dynamic>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<Function > a6 = A<dynamic>();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<dynamic> a7 = A<dynamic>();

  const A<Null> a8 = A<dynamic>();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<void> a9 = A<dynamic>();

  const A<Never> a10 = A<dynamic>();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  const A<FutureOr> a11 = A<dynamic>();
}

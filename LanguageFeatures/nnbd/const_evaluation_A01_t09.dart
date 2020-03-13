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
 * evaluated correctly for [Never] type argument.
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
  const A<int?     > a1  = A<Never>();
  const A<int      > a2  = A<Never>();
  const A<Object?  > a3  = A<Never>();
  const A<Object   > a4  = A<Never>();
  const A<Function?> a5  = A<Never>();
  const A<Function > a6  = A<Never>();
  const A<dynamic  > a7  = A<Never>();
  const A<Null     > a8  = A<Never>();
  const A<void     > a9  = A<Never>();
  const A<Never    > a10 = A<Never>();
  const A<FutureOr > a11 = A<Never>();
}

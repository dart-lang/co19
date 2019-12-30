/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use the null check operator (!) on a
 * non-nullable expression.
 *
 * @description Check that it is a warning to use the null check operator (!) on
 * a non-nullable expression. Test FutureOr<FutureOr<A>>
 * @author sgrekhov@unipro.ru
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

class A {}

main() {
  FutureOr<FutureOr<A>> a = new A();
  a!;     //# 01: static type warning
}

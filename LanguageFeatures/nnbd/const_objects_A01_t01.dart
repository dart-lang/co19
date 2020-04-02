/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form 'e as T' is potentially constant if e is
 * a potentially constant expression and T is a potentially constant type
 * expression, and it is further constant if e is constant
 *
 * @description Checks that an expression of the form 'e as T' is potentially
 * constant if e is a potentially constant expression and T is a potentially
 * constant type expression, and it is further constant if e is constant
 *
 * @author sgrekhov@unipro.ru
 * @issue 41286
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
const num three = 3;

class C<T extends num> {
  final T w;
  const C() : w = three as T;
}

void main() {
  Expect.equals(three, const C<int>().w);
}
/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   T?? == T?
 *
 * @description Checks that T?? == T?
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

class T {}

typedef T1 = T?;
typedef T2 = T1?;

main() {
  T2 t = new T2();
  T? t1 = t;
  T? t2 = new T();
  T2 t3 = t2;
}

/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   Null? == Null
 *
 * @description Checks that Null? == Null
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

main() {
  Null t = null;
  Null? t1 = t;
  Null? t2 = null;
  Null t3 = t3;
}

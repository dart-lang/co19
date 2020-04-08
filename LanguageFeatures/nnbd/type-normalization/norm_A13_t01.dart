/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   X extend Never == Never
 *
 * @description Checks that X extend Never == Never
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

test<X extends Never>(X x, Never n2) {
  Never n1 = x;
  x = n2;
}

main() {
}

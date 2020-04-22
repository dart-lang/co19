/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   dynamic? == dynamic
 *
 * @description Checks that dynamic? == dynamic
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A<X> {}
class B<X> implements A<X> {}

class C extends B<dynamic?> implements A<dynamic> {}

main() {
  new C();
}

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
 * @description Checks that T1?? != T? for some T1 <: T
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class T {}
class T1 extends T {}
class A<X> {}
class B<X> implements A<X?> {}

  class C extends B<T1?> implements A<T?> {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified
main() {
  new C();
}

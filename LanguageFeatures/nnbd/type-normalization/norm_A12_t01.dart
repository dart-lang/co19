/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   FutureOr<T> == Future<T> if T <: Future<T>
 *
 * @description Checks that if T <: Future<T> then FutureOr<T> == Future<T>
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

class A<X> {}
class B<X> implements A<X> {}

class C extends B<FutureOr<Null>> implements A<Future<Null>?> {}

main() {
  new C();
}

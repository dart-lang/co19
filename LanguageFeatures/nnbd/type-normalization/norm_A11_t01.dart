/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   FutureOr<T> == T if Future<T> <: T
 *
 * @description Checks that if Future<T> <: T then FutureOr<T> == T
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'dart:async';

main() {
  FutureOr<Object> f = new Future<Object>.value(new Object());
  Object c = f;
  FutureOr<Object> f1 = new Object();
}

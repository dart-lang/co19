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

class C {}

main() {
  FutureOr<Future<Object>> f =
    new Future<Future<Object>>.value(new Future<Object>.value(new Object()));
  Future<Object> f1 = f;
  FutureOr<Future<Object>> f2 =
    new Future<Future<Object>>.value(new Future<Object>.value(new Object()));
}

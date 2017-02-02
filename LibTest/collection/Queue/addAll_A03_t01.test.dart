/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> iterable)
 * Fails gracefully if supplied with an argument of a wrong type.
 * @description Tries to pass various wrong parameters to the method.
 * @author iefremov
 */
library addAll_A03_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  dynamic x1 = 1, x2 = 1.1, x3 = "";
  Expect.throws(() => create().addAll(x1));
  Expect.throws(() => create().addAll(x2));
  Expect.throws(() => create().addAll(x3));
}

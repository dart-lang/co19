/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class WebSocket
 * A two-way HTTP communication object for client or server applications.
 * The stream exposes the messages received. A text message will be of
 * type String and a binary message will be of type List<int>.
 * @description Aggregates tests for Stream interface (error processing)
 * @author a.semenov@unipro.ru
 */
library allTests_A02;

import "last_A03_t01.test.dart" as last_A03_t01;

void test(var create) {
  last_A03_t01.test(create);
}

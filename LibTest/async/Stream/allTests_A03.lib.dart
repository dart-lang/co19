// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion class Stream
/// @description Aggregates currently failing tests for Stream interface
/// @author a.semenov@unipro.ru

library allTests_A03;

import "../../../Utils/expect.dart";

import "asBroadcastStream_A05_t03.test.dart" as asBroadcastStream_A05_t03;

import "asyncMap_A04_t01.test.dart" as asyncMap_A04_t01;

void test(CreateStreamFunction create) {
  asyncStart();
  asBroadcastStream_A05_t03.test(create);
  // failures TODO move in place when fixed
  asyncMap_A04_t01.test(create); // issue #29615
  asyncEnd();
}

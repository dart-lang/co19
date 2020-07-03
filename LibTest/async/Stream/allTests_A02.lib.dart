/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class Stream
 * @description Aggregates tests for Stream interface (errors processing)
 * @author a.semenov@unipro.ru
 */
library allTests_A02;
import "../../../Utils/expect.dart";

import "any_A02_t01.test.dart" as any_A02_t01;

import "asBroadcastStream_A05_t02.test.dart" as asBroadcastStream_A05_t02;

import "asyncMap_A03_t01.test.dart" as asyncMap_A03_t01;

import "contains_A03_t01.test.dart" as contains_A03_t01;
import "contains_A03_t02.test.dart" as contains_A03_t02;
import "contains_A03_t03.test.dart" as contains_A03_t03;

import "distinct_A04_t01.test.dart" as distinct_A04_t01;
import "distinct_A04_t02.test.dart" as distinct_A04_t02;

import "drain_A01_t01.test.dart" as drain_A01_t01;

import "elementAt_A02_t01.test.dart" as elementAt_A02_t01;

import "every_A02_t01.test.dart" as every_A02_t01;

import "first_A03_t01.test.dart" as first_A03_t01;

import "firstWhere_A03_t01.test.dart" as firstWhere_A03_t01;

import "forEach_A02_t01.test.dart" as forEach_A02_t01;

import "handleError_A01_t01.test.dart" as handleError_A01_t01;
import "handleError_A02_t01.test.dart" as handleError_A02_t01;
import "handleError_A03_t01.test.dart" as handleError_A03_t01;
import "handleError_A05_t01.test.dart" as handleError_A05_t01;
import "handleError_A07_t01.test.dart" as handleError_A07_t01;

import "isEmpty_A03_t01.test.dart" as isEmpty_A03_t01;

import "join_A02_t01.test.dart" as join_A02_t01;

import "last_A03_t01.test.dart" as last_A03_t01;

import "lastWhere_A03_t01.test.dart" as lastWhere_A03_t01;

import "length_A02_t01.test.dart" as length_A02_t01;

import "listen_A03_t01.test.dart" as listen_A03_t01;
import "listen_A04_t01.test.dart" as listen_A04_t01;

import "map_A03_t01.test.dart" as map_A03_t01;

import "pipe_A01_t02.test.dart" as pipe_A01_t02;

import "reduce_A03_t01.test.dart" as reduce_A03_t01;

import "single_A03_t01.test.dart" as single_A03_t01;

import "skip_A03_t01.test.dart" as skip_A03_t01;

import "skipWhile_A02_t01.test.dart" as skipWhile_A02_t01;

import "take_A01_t02.test.dart" as take_A01_t02;

import "takeWhile_A01_t02.test.dart" as takeWhile_A01_t02;

import "timeout_A01_t02.test.dart" as timeout_A01_t02;

import "transform_A01_t01.test.dart" as transform_A01_t01;

import "where_A01_t02.test.dart" as where_A01_t02;

void test(CreateStreamWithErrorsFunction create) {
  any_A02_t01.test(create);

  asBroadcastStream_A05_t02.test(create);

  asyncMap_A03_t01.test(create);

  contains_A03_t01.test(create);
  contains_A03_t02.test(create);
  contains_A03_t03.test(create);

  distinct_A04_t01.test(create);
  distinct_A04_t02.test(create);

  drain_A01_t01.test(create);

  elementAt_A02_t01.test(create);

  every_A02_t01.test(create);

  first_A03_t01.test(create);

  firstWhere_A03_t01.test(create);

  forEach_A02_t01.test(create);

  handleError_A01_t01.test(create);
  handleError_A02_t01.test(create);
  handleError_A03_t01.test(create);
  handleError_A05_t01.test(create);
  handleError_A07_t01.test(create);

  isEmpty_A03_t01.test(create);

  join_A02_t01.test(create);

  last_A03_t01.test(create);

  lastWhere_A03_t01.test(create);

  length_A02_t01.test(create);

  listen_A03_t01.test(create);
  listen_A04_t01.test(create);

  map_A03_t01.test(create);

  pipe_A01_t02.test(create);

  reduce_A03_t01.test(create);

  single_A03_t01.test(create);

  skip_A03_t01.test(create);

  skipWhile_A02_t01.test(create);

  take_A01_t02.test(create);

  takeWhile_A01_t02.test(create);

  timeout_A01_t02.test(create);

  transform_A01_t01.test(create);

  where_A01_t02.test(create);
}

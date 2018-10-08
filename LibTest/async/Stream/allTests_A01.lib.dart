/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class Stream
 * @description Aggregates tests for Stream interface
 * @author a.semenov@unipro.ru
 */
library allTests_A01;
import "../../../Utils/expect.dart";

import "any_A01_t01.test.dart" as any_A01_t01;
import "any_A01_t02.test.dart" as any_A01_t02;

import "asBroadcastStream_A01_t01.test.dart" as asBroadcastStream_A01_t01;
import "asBroadcastStream_A01_t02.test.dart" as asBroadcastStream_A01_t02;
import "asBroadcastStream_A01_t04.test.dart" as asBroadcastStream_A01_t04;
import "asBroadcastStream_A03_t01.test.dart" as asBroadcastStream_A03_t01;
import "asBroadcastStream_A03_t02.test.dart" as asBroadcastStream_A03_t02;
import "asBroadcastStream_A03_t03.test.dart" as asBroadcastStream_A03_t03;
import "asBroadcastStream_A04_t01.test.dart" as asBroadcastStream_A04_t01;
import "asBroadcastStream_A04_t02.test.dart" as asBroadcastStream_A04_t02;
import "asBroadcastStream_A04_t03.test.dart" as asBroadcastStream_A04_t03;
import "asBroadcastStream_A05_t01.test.dart" as asBroadcastStream_A05_t01;

import "asyncExpand_A01_t01.test.dart" as asyncExpand_A01_t01;
import "asyncExpand_A02_t01.test.dart" as asyncExpand_A02_t01;
import "asyncExpand_A03_t01.test.dart" as asyncExpand_A03_t01;

import "asyncMap_A01_t01.test.dart" as asyncMap_A01_t01;
import "asyncMap_A01_t02.test.dart" as asyncMap_A01_t02;
import "asyncMap_A01_t03.test.dart" as asyncMap_A01_t03;
import "asyncMap_A01_t04.test.dart" as asyncMap_A01_t04;
import "asyncMap_A02_t01.test.dart" as asyncMap_A02_t01;
import "asyncMap_A03_t02.test.dart" as asyncMap_A03_t02;
import "asyncMap_A03_t03.test.dart" as asyncMap_A03_t03;
import "asyncMap_A04_t01.test.dart" as asyncMap_A04_t01;

import "contains_A01_t01.test.dart" as contains_A01_t01;
import "contains_A02_t01.test.dart" as contains_A02_t01;

import "distinct_A01_t01.test.dart" as distinct_A01_t01;
import "distinct_A01_t02.test.dart" as distinct_A01_t02;
import "distinct_A02_t01.test.dart" as distinct_A02_t01;
import "distinct_A02_t02.test.dart" as distinct_A02_t02;
import "distinct_A03_t01.test.dart" as distinct_A03_t01;
import "distinct_A05_t01.test.dart" as distinct_A05_t01;

import "drain_A02_t01.test.dart" as drain_A02_t01;
import "drain_A02_t02.test.dart" as drain_A02_t02;


import "elementAt_A01_t01.test.dart" as elementAt_A01_t01;
import "elementAt_A01_t02.test.dart" as elementAt_A01_t02;
import "elementAt_A01_t03.test.dart" as elementAt_A01_t03;
import "elementAt_A03_t01.test.dart" as elementAt_A03_t01;

import "every_A01_t01.test.dart" as every_A01_t01;
import "every_A03_t01.test.dart" as every_A03_t01;

import "expand_A01_t01.test.dart" as expand_A01_t01;
import "expand_A02_t01.test.dart" as expand_A02_t01;
import "expand_A02_t02.test.dart" as expand_A02_t02;
import "expand_A03_t01.test.dart" as expand_A03_t01;

import "first_A01_t01.test.dart" as first_A01_t01;
import "first_A02_t01.test.dart" as first_A02_t01;
import "first_A02_t02.test.dart" as first_A02_t02;
import "first_A04_t01.test.dart" as first_A04_t01;

import "firstWhere_A01_t01.test.dart" as firstWhere_A01_t01;
import "firstWhere_A01_t02.test.dart" as firstWhere_A01_t02;
import "firstWhere_A02_t01.test.dart" as firstWhere_A02_t01;
import "firstWhere_A03_t02.test.dart" as firstWhere_A03_t02;
import "firstWhere_A03_t03.test.dart" as firstWhere_A03_t03;
import "firstWhere_A03_t04.test.dart" as firstWhere_A03_t04;
import "firstWhere_A04_t01.test.dart" as firstWhere_A04_t01;

import "fold_A01_t01.test.dart" as fold_A01_t01;
import "fold_A01_t02.test.dart" as fold_A01_t02;

import "forEach_A01_t01.test.dart" as forEach_A01_t01;
import "forEach_A02_t02.test.dart" as forEach_A02_t02;

import "handleError_A06_t01.test.dart" as handleError_A06_t01;

import "isEmpty_A01_t01.test.dart" as isEmpty_A01_t01;
import "isEmpty_A02_t01.test.dart" as isEmpty_A02_t01;
import "isEmpty_A04_t01.test.dart" as isEmpty_A04_t01;

import "join_A01_t01.test.dart" as join_A01_t01;
import "join_A01_t02.test.dart" as join_A01_t02;
import "join_A02_t02.test.dart" as join_A02_t02;

import "last_A01_t01.test.dart" as last_A01_t01;
import "last_A02_t01.test.dart" as last_A02_t01;

import "lastWhere_A01_t01.test.dart" as lastWhere_A01_t01;
import "lastWhere_A01_t01.test.dart" as lastWhere_A01_t02;
import "lastWhere_A02_t01.test.dart" as lastWhere_A02_t01;
import "lastWhere_A04_t01.test.dart" as lastWhere_A04_t01;
import "lastWhere_A05_t01.test.dart" as lastWhere_A05_t01;
import "lastWhere_A06_t01.test.dart" as lastWhere_A06_t01;

import "length_A01_t01.test.dart" as length_A01_t01;

import "listen_A01_t01.test.dart" as listen_A01_t01;
import "listen_A02_t01.test.dart" as listen_A02_t01;
import "listen_A06_t01.test.dart" as listen_A06_t01;

import "map_A01_t01.test.dart" as map_A01_t01;
import "map_A02_t01.test.dart" as map_A02_t01;
import "map_A04_t01.test.dart" as map_A04_t01;
import "map_A05_t01.test.dart" as map_A05_t01;

import "pipe_A01_t01.test.dart" as pipe_A01_t01;
import "pipe_A02_t01.test.dart" as pipe_A02_t01;
import "pipe_A03_t01.test.dart" as pipe_A03_t01;
import "pipe_A03_t02.test.dart" as pipe_A03_t02;
import "pipe_A04_t01.test.dart" as pipe_A04_t01;
import "pipe_A04_t02.test.dart" as pipe_A04_t02;

import "reduce_A01_t01.test.dart" as reduce_A01_t01;
import "reduce_A01_t02.test.dart" as reduce_A01_t02;
import "reduce_A01_t03.test.dart" as reduce_A01_t03;
import "reduce_A01_t04.test.dart" as reduce_A01_t04;
import "reduce_A02_t01.test.dart" as reduce_A02_t01;

import "single_A01_t01.test.dart" as single_A01_t01;
import "single_A02_t01.test.dart" as single_A02_t01;

import "singleWhere_A01_t01.test.dart" as singleWhere_A01_t01;
import "singleWhere_A02_t01.test.dart" as singleWhere_A02_t01;

import "skip_A01_t01.test.dart" as skip_A01_t01;
import "skip_A02_t01.test.dart" as skip_A02_t01;

import "skipWhile_A01_t01.test.dart" as skipWhile_A01_t01;
import "skipWhile_A03_t01.test.dart" as skipWhile_A03_t01;
import "skipWhile_A04_t01.test.dart" as skipWhile_A04_t01;

import "take_A01_t01.test.dart" as take_A01_t01;
import "take_A02_t01.test.dart" as take_A02_t01;

import "takeWhile_A01_t01.test.dart" as takeWhile_A01_t01;
import "takeWhile_A01_t03.test.dart" as takeWhile_A01_t03;
import "takeWhile_A02_t01.test.dart" as takeWhile_A02_t01;

import "timeout_A01_t01.test.dart" as timeout_A01_t01;
import "timeout_A02_t01.test.dart" as timeout_A02_t01;
import "timeout_A02_t02.test.dart" as timeout_A02_t02;
import "timeout_A03_t01.test.dart" as timeout_A03_t01;
import "timeout_A03_t02.test.dart" as timeout_A03_t02;
import "timeout_A05_t01.test.dart" as timeout_A05_t01;

import "toList_A01_t01.test.dart" as toList_A01_t01;
import "toSet_A01_t01.test.dart" as toSet_A01_t01;

import "transform_A01_t02.test.dart" as transform_A01_t02;

import "where_A01_t01.test.dart" as where_A01_t01;

void test(CreateStreamFunction create) {
  any_A01_t01.test(create);
  any_A01_t02.test(create);

  asBroadcastStream_A01_t01.test(create);
  asBroadcastStream_A01_t02.test(create);
  asBroadcastStream_A01_t04.test(create);
  asBroadcastStream_A03_t01.test(create);
  asBroadcastStream_A03_t02.test(create);
  asBroadcastStream_A03_t03.test(create);
  asBroadcastStream_A04_t01.test(create);
  asBroadcastStream_A04_t02.test(create);
  asBroadcastStream_A04_t03.test(create);
  asBroadcastStream_A05_t01.test(create);

  asyncExpand_A01_t01.test(create);
  asyncExpand_A02_t01.test(create);
  asyncExpand_A03_t01.test(create);

  asyncMap_A01_t01.test(create);
  asyncMap_A01_t02.test(create);
  asyncMap_A01_t03.test(create);
  asyncMap_A01_t04.test(create);
  asyncMap_A02_t01.test(create);
  asyncMap_A03_t02.test(create);
  asyncMap_A03_t03.test(create);
//  asyncMap_A04_t01.test(create); // fails with error, moved to allTests_A03

  contains_A01_t01.test(create);
  contains_A02_t01.test(create);

  distinct_A01_t01.test(create);
  distinct_A01_t02.test(create);
  distinct_A02_t01.test(create);
  distinct_A02_t02.test(create);
//  distinct_A03_t01.test(create); // fails with error, moved to allTests_A03
  distinct_A05_t01.test(create);

//  drain_A02_t01.test(create); // fails with error, moved to allTests_A03
  drain_A02_t02.test(create);

  elementAt_A01_t01.test(create);
  elementAt_A01_t02.test(create);
  elementAt_A01_t03.test(create);
  elementAt_A03_t01.test(create);

  every_A01_t01.test(create);
  every_A03_t01.test(create);

  expand_A01_t01.test(create);
  expand_A02_t01.test(create);
  expand_A02_t02.test(create);
  expand_A03_t01.test(create);

  first_A01_t01.test(create);
  first_A02_t01.test(create);
  first_A02_t02.test(create);
  first_A04_t01.test(create);

  firstWhere_A01_t01.test(create);
  firstWhere_A01_t02.test(create);
  firstWhere_A02_t01.test(create);
  firstWhere_A03_t02.test(create);
  firstWhere_A03_t03.test(create);
  firstWhere_A03_t04.test(create);
  firstWhere_A04_t01.test(create);

  fold_A01_t01.test(create);
  fold_A01_t02.test(create);

  forEach_A01_t01.test(create);
  forEach_A02_t02.test(create);

  handleError_A06_t01.test(create);

  isEmpty_A01_t01.test(create);
  isEmpty_A02_t01.test(create);
  isEmpty_A04_t01.test(create);

  join_A01_t01.test(create);
  join_A01_t02.test(create);
  join_A02_t02.test(create);

  last_A01_t01.test(create);
  last_A02_t01.test(create);

  lastWhere_A01_t01.test(create);
  lastWhere_A01_t02.test(create);
  lastWhere_A02_t01.test(create);
  lastWhere_A04_t01.test(create);
  lastWhere_A05_t01.test(create);
  lastWhere_A06_t01.test(create);

  length_A01_t01.test(create);

  listen_A01_t01.test(create);
  listen_A02_t01.test(create);
  listen_A06_t01.test(create);

  map_A01_t01.test(create);
  map_A02_t01.test(create);
  map_A04_t01.test(create);
  map_A05_t01.test(create);

  pipe_A01_t01.test(create);
  pipe_A02_t01.test(create);
  pipe_A03_t01.test(create);
  pipe_A03_t02.test(create);
  pipe_A04_t01.test(create);
  pipe_A04_t02.test(create);

  reduce_A01_t01.test(create);
  reduce_A01_t02.test(create);
  reduce_A01_t03.test(create);
  reduce_A01_t04.test(create);
  reduce_A02_t01.test(create);

  single_A01_t01.test(create);
  single_A02_t01.test(create);

  singleWhere_A01_t01.test(create);
  singleWhere_A02_t01.test(create);

  skip_A01_t01.test(create);
  skip_A02_t01.test(create);

  skipWhile_A01_t01.test(create);
  skipWhile_A03_t01.test(create);
  skipWhile_A04_t01.test(create);

  take_A01_t01.test(create);
  take_A02_t01.test(create);

  takeWhile_A01_t01.test(create);
  takeWhile_A01_t03.test(create);
  takeWhile_A02_t01.test(create);

  timeout_A01_t01.test(create);
  timeout_A02_t01.test(create);
  timeout_A02_t02.test(create);
  timeout_A03_t01.test(create);
  timeout_A03_t02.test(create);
  timeout_A05_t01.test(create);

  toList_A01_t01.test(create);
  toSet_A01_t01.test(create);

  transform_A01_t02.test(create);

  where_A01_t01.test(create);
}

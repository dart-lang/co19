// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class Pair<S, T> {
  final S fst;
  final T snd;
  Pair._(this.fst, this.snd);
}

extension ExtPair<X> on Pair<X, X> {
  factory fromList(List<X> l) => Pair._(l[0], l[1]);
  factory twice(X x) {
    return Pair._(x, x);
  }
  factory redirecting(X x1, X x2) = Pair._;
}

extension ExtIntPair on Pair<int, String> {
  factory(int i) => Pair._(i, "$i");
}

extension ExtNumPair<N extends num, Z> on Pair<N, Z> {
  factory bounded(N n, Z z) => Pair._(n, z);
}

void testeeMain() {
  debugger();
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

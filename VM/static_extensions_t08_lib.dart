// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

const String x = "Global";

class C<X, Y> {
  final X v1;
  final Y v2;
  C._(this.v1, this.v2);
}

extension ExtC<T extends num> on C<T, List<T>> {
  static String get staticMember => "ExtC";

  factory named(T x, {int y = 2}) {
    var local = [x];
    debugger(); // LINE_A
    return C._(x, local);
  }
}

void testeeMain() {
  debugger(); // LINE_B
  C.named(42); // LINE_C
  C<num, Object>.named(3.14, y: 3); // LINE_D
  ExtC<num>.named(0); // LINE_E
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

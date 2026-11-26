// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C {
  final int v;
  C._(this.v); // LINE_A
}

extension ExtC on C {
  factory() => C._(1); // LINE_B
  factory named() => C._(2); // LINE_C
  factory redirecting(int v) = C._;
}

void testeeMain() {
  debugger(); // LINE_D
  C(); // LINE_E
  C.new(); // LINE_F
  C.named(); // LINE_G
  ExtC.named(); // LINE_H
  var f = C.named; // LINE_I
  f(); // LINE_J
  C.redirecting(3); // LINE_K
  ExtC.redirecting(4); // LINE_L
  print("Done"); // LINE_M
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

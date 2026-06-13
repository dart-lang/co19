// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

final int x = 42;
int y = 0;

extension type ET1(int x) /* LINE_A */ {
  this : assert(x > 0); // LINE_B
}

extension type ET2(int x) /* LINE_C */ {
  this {
    y = 2; // LINE_D
  } // LINE_E
}

extension type ET3(int x) /* LINE_F */ {
  this : assert(x > 0) {
    // LINE_G
    y = 3; // LINE_H
  } // LINE_I
}

void testeeMain() {
  debugger(); // LINE_J
  ET1(1); // LINE_K
  ET2(2); // LINE_L
  ET3(3); // LINE_M
} // LINE_N

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

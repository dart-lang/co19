// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

final int x = 99;

class C1(var String x); // LINE_A

void testeeMain() {
  debugger(); // LINE_B
  C1('xxx'); // LINE_C
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

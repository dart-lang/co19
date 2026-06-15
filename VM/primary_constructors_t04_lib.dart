// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C1(var int v1, final int v2); // LINE_A

class C2(int v1, int v2) /* LINE_B */ {
  int v1;
  final int v2;
  this : v1 = v1, v2 = v2;
}

class C3(var int v1, int v2) /* LINE_C */ {
  int? v3;
  this {
    v3 = v2; // LINE_D
  }
}

void testeeMain() {
  debugger();
  var c1 = C1(1, 2);
  var c2 = C2(3, 4);
  var c3 = C3(5, 6);
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

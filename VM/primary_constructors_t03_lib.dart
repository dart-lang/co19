// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

final int x = 42;
final String y = '42';
const String z = '42';

class C1(var String x) /* LINE_A */ {
  String y;
  this : y = 'yyy'; // LINE_B
}

class C2(var String x) /* LINE_C */ {
  String? y;
  this {
    y = 'yyy'; // LINE_D
  } // LINE_E
}

class C3(var String x) /* LINE_F */ {
  String y;
  String? z;
  this : y = x /* LINE_G */ {
    z = 'zzz'; // LINE_H
  } // LINE_I
}

void testeeMain() {
  debugger(); // LINE_J
  C1('xxx'); // LINE_K
  C2('xxx'); // LINE_L
  C3('xxx'); // LINE_M
} // LINE_N

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

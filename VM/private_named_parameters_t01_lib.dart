// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors,private-named-parameters

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C1({var String? _x}); // LINE_A

class C2 {
  String _x;
  C2({required this._x}); // LINE_B
}

class C3 {
  int _x, _y;
  C3({required this._x}) : _y = _x + 1; // LINE_C
}

void testeeMain() {
  debugger(); // LINE_D
  C1(x: "xxx"); // LINE_E
  C2(x: "yyy"); // LINE_F
  C3(x: 1); // LINE_G
}

void main() {
  startServiceTest(testeeConcurrent: testeeMain);
}

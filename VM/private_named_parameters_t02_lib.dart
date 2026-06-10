// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors,private-named-parameters

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C1({var String? _x});

class C2 {
  String _x;
  C2({required this._x});
}

void testeeMain() {
  final c1 = C1(x: "one");
  final c2 = C2(x: "two");
  debugger();
}

void main() {
  startServiceTest(testeeConcurrent: testeeMain);
}

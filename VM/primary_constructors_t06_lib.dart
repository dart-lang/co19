// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

extension type ET1(int v) {
  this : assert(v > 0); // LINE_A
}

extension type ET2(int v) {
  this {
    print(v); // LINE_B
  }
}

void testeeMain() {
  debugger();
  ET1(1);
  ET2(2);
}

void main() {
  startServiceTest(testeeConcurrent: testeeMain);
}

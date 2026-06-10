// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

void testeeMain() {
  var v1 = 1_000__000_000;
  var v2 = 0x4__000_0000;
  debugger();
}

void main() {
  startServiceTest(testeeConcurrent: testeeMain);
}

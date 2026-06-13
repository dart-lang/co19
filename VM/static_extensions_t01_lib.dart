// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import '../../../../pkg/vm_service/test/common/test_helper.dart';

class C {}

extension ExtC on C {
  static String foo() => "ExtC";
}

void testeeMain() {
  debugger();
}

Future<void> main([args = const <String>[]]) =>
    startServiceTest(testeeConcurrent: testeeMain);

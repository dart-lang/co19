// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow one or more `_`s between any two otherwise adjacent digits
/// of a `NUMBER` or `HEX_NUMBER` token.
///
/// @description Check that digit separators are allowed in VM expression
/// evaluation.
/// @author sgrekhov22@gmail.com

import 'dart:developer';

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../../../../pkg/vm_service/test/common/test_helper.dart';
import '../Utils/expect.dart';

void testeeMain() {
  var v1 = 1_000__000_000;
  var v2 = 0x4000_0000__0000_0000;
  debugger();
}

final tests = <IsolateTest>[
  hasStoppedAtBreakpoint,

  // Test interaction of expression evaluation with digit separators.
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;

    InstanceRef response =
        await service.evaluateInFrame(isolateId, 0, 'v1') as InstanceRef;
    Expect.equals('1000000000', response.valueAsString);

    response = await service.evaluateInFrame(isolateId, 0, 'v2') as InstanceRef;
    Expect.equals(0x4000000000000000.toRadixString(10), response.valueAsString);

    response =
        await service.evaluateInFrame(isolateId, 0, 'v1 + 1_2__3')
            as InstanceRef;
    Expect.equals('1000000123', response.valueAsString);

    response =
        await service.evaluateInFrame(isolateId, 0, 'v2 + 0x1_2__3')
            as InstanceRef;
    Expect.equals(0x4000000000000123.toRadixString(10), response.valueAsString);
  },
];

void main([args = const <String>[]]) => runIsolateTests(
  args,
  tests,
  'digit_separators_t01.dart',
  pauseOnExit: true,
  testeeConcurrent: testeeMain,
);

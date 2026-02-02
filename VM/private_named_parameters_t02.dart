// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We let users use a private name in a named parameter when the
/// parameter also initializes or declares a field. The compiler removes the `_`
/// from the argument name but keeps it for the corresponding field.
///
/// @description Check that private named parameters are allowed in VM
/// expression evaluation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors,private-named-parameters

import 'dart:developer';

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../../../../pkg/vm_service/test/common/test_helper.dart';
import '../Utils/expect.dart';

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

final tests = <IsolateTest>[
  hasStoppedAtBreakpoint,

  // Test interaction of expression evaluation with private named parameters.
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;

    InstanceRef response =
       await service.evaluateInFrame(isolateId, 0, 'c1._x') as InstanceRef;
    Expect.equals('one', response.valueAsString);

    response =
        await service.evaluateInFrame(isolateId, 0, 'c2._x') as InstanceRef;
    Expect.equals('two', response.valueAsString);

    response =
        await service.evaluateInFrame(isolateId, 0, 'C1(x: "zero")._x')
            as InstanceRef;
    Expect.equals('zero', response.valueAsString);

    response =
        await service.evaluateInFrame(isolateId, 0, 'C2(x: "0")._x')
            as InstanceRef;
    Expect.equals('0', response.valueAsString);
  },
];

void main([args = const <String>[]]) => runIsolateTests(
  args,
  tests,
  'private_named_parameters_t02.dart',
  pauseOnExit: true,
  testeeConcurrent: testeeMain,
);

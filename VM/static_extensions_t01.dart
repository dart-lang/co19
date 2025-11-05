// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
/// ...
/// Assume that it is an extension `E` that declares a static member named `m`.
/// The invocation is then treated as `E.m()`.
///
/// @description Check that declaring constructors invocation and declaration
/// can be debugged.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../../../../pkg/vm_service/test/common/test_helper.dart';
import '../Utils/expect.dart';

class C {}

extension ExtC on C {
  static String foo() => "ExtC";
}

void testeeMain() {
  debugger();
}

final tests = <IsolateTest>[
  hasStoppedAtBreakpoint,

  // Test interaction of expression evaluation with static extensions.
      (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;

    InstanceRef response =
      await service.evaluateInFrame(isolateId, 0, 'C.foo()') as InstanceRef;
    Expect.equals('ExtC', response.valueAsString);
  },
];

void main([args = const <String>[]]) => runIsolateTests(
  args,
  tests,
  'static_extensions_t01.dart',
  pauseOnExit: true,
  testeeConcurrent: testeeMain,
);

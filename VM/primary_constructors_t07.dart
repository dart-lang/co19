// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that parameter of the primary constructor has correct
/// values in an initializing expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';

void main([args = const <String>[]]) =>
    IsolateTestHarness('primary_constructors_t07_lib.dart', args)
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_B')
        .stepInto()
        .stoppedAtLine('LINE_C')
        .stepInto()
        .stoppedAtLine('LINE_A')
        .addCustomTest((VmService srv, IsolateRef isolateRef) async {
          final islId = isolateRef.id!;
          final xRef1 = await srv.evaluateInFrame(islId, 0, 'x') as InstanceRef;
          Expect.equals('null', xRef1.valueAsString);
          final xRef2 = await srv.evaluateInFrame(islId, 0, 'y') as InstanceRef;
          Expect.equals('null', xRef2.valueAsString);
        })
        .stepInto()
        .stoppedAtLine('LINE_A')
        .addCustomTest((VmService srv, IsolateRef isolateRef) async {
          final islId = isolateRef.id!;
          final xRef1 = await srv.evaluateInFrame(islId, 0, 'x') as InstanceRef;
          Expect.equals('c1', xRef1.valueAsString);
          final xRef2 = await srv.evaluateInFrame(islId, 0, 'y') as InstanceRef;
          Expect.equals('c1', xRef2.valueAsString);
        })
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=primary-constructors'],
        );

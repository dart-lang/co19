// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that in-body part of a primary constructor can be
/// debugged.
/// @author sgrekhov22@gmail.com
/// @issue 63980

import 'dart:developer';
import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'primary_constructors_t03_lib.dart' as testee_lib;

void main([
  args = const <String>[],
]) => IsolateTestHarness('primary_constructors_t03_lib.dart', args)
    .hasStoppedAtBreakpoint()
    .stoppedAtLine('LINE_J')
    .stepInto()
    .stoppedAtLine('LINE_K')
    .stepInto()
    .stoppedAtLine('LINE_A')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('null', yRef.valueAsString);
    })
    .stepInto()
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('yyy', yRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_L')
    .stepInto()
    .stoppedAtLine('LINE_C')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('null', yRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_D')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('null', yRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_E')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('yyy', yRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_M')
    .stepInto()
    .stoppedAtLine('LINE_F')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('42', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('42', yRef.valueAsString);
      final zRef = await service.evaluateInFrame(islId, 0, 'z') as InstanceRef;
      Expect.equals('42', zRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_G')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('xxx', yRef.valueAsString);
      final zRef = await service.evaluateInFrame(islId, 0, 'z') as InstanceRef;
      Expect.equals('null', zRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_H')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('xxx', yRef.valueAsString);
      final zRef = await service.evaluateInFrame(islId, 0, 'z') as InstanceRef;
      Expect.equals('null', zRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_I')
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final islId = isolateRef.id!;
      final xRef = await service.evaluateInFrame(islId, 0, 'x') as InstanceRef;
      Expect.equals('xxx', xRef.valueAsString);
      final yRef = await service.evaluateInFrame(islId, 0, 'y') as InstanceRef;
      Expect.equals('xxx', yRef.valueAsString);
      final zRef = await service.evaluateInFrame(islId, 0, 'z') as InstanceRef;
      Expect.equals('zzz', zRef.valueAsString);
    })
    .stepInto()
    .stoppedAtLine('LINE_N')
    .run(
      pauseOnExit: true,
      testeeMain: testee_lib.main,
    );

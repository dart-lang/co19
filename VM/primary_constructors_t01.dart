// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that primary constructors invocation and declaration
/// can be debugged.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';

void main([
  args = const <String>[],
]) => IsolateTestHarness('primary_constructors_t01_lib.dart', args)
    .hasStoppedAtBreakpoint()
    // Test interaction of expression evaluation with invocation of primary constructors,
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      final isolateId = isolateRef.id!;

      InstanceRef response = await service.evaluateInFrame(
        isolateId,
        0,
        'C1(1, 2).v1',
      ) as InstanceRef;
      Expect.equals('1', response.valueAsString);

      response = await service.evaluateInFrame(
        isolateId,
        0,
        'C2(3, 4).v1',
      ) as InstanceRef;
      Expect.equals('3', response.valueAsString);

      response = await service.evaluateInFrame(
        isolateId,
        0,
        'C3(5, 6).v3',
      ) as InstanceRef;
      Expect.equals('6', response.valueAsString);
    })
    // Test interaction of breakpoints with invocations of primary constructors.
    .addCustomTestWithParser((
      VmService service,
      IsolateRef isolateRef,
      TestScriptParser parser,
    ) async {
      final isolateId = isolateRef.id!;
      final isolate = await service.getIsolate(isolateId);
      final lib =
          (await service.getObject(isolateId, isolate.rootLib!.id!)) as Library;
      final scriptId = lib.scripts!.first.id!;

      var breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_E'),
      );
      var (_, (line, column)) = await breakpoint.getLocation(
        service,
        isolateRef,
      );
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_E'), line);
      Expect.equals(10, column); // on '('

      breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_F'),
      );
      (_, (line, column)) = await breakpoint.getLocation(service, isolateRef);
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_F'), line);
      Expect.equals(10, column); // on '('

      breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_G'),
      );
      (_, (line, column)) = await breakpoint.getLocation(service, isolateRef);
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_G'), line);
      Expect.equals(10, column); // on '('

      await service.removeBreakpoint(isolateId, breakpoint.id!);
    })
    .setBreakpointAtLine('LINE_E')
    .runStepIntoThroughProgramRecordingStops()
    .checkRecordedStops()
    .run(
      pauseOnExit: true,
      extraArgs: ['--enable-experiment=primary-constructors'],
    );

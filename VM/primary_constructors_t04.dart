// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that breakpoint can be set on a primary constructor.
/// @author sgrekhov22@gmail.com
/// @issue 62053

// SharedOptions=--enable-experiment=primary-constructors

import 'dart:developer';
import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'primary_constructors_t04_lib.dart' as testee_lib;

void main([
  args = const <String>[],
]) => IsolateTestHarness('primary_constructors_t04_lib.dart', args)
    .hasStoppedAtBreakpoint()
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
        parser.lineForTag('LINE_A'),
      );
      var (_, (line, column)) = await breakpoint.getLocation(
        service,
        isolateRef,
      );
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_A'), line);
      Expect.equals(9, column); // on '('

      breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_B'),
      );
      (_, (line, column)) = await breakpoint.getLocation(service, isolateRef);
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_B'), line);
      Expect.equals(9, column); // on '('

      breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_C'),
      );
      (_, (line, column)) = await breakpoint.getLocation(service, isolateRef);
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_C'), line);
      Expect.equals(9, column); // on '('

      breakpoint = await service.addBreakpoint(
        isolateId,
        scriptId,
        parser.lineForTag('LINE_D'),
      );
      (_, (line, column)) = await breakpoint.getLocation(service, isolateRef);
      Expect.isTrue(breakpoint.enabled);
      Expect.equals(parser.lineForTag('LINE_D'), line);
      Expect.equals(5, column); // on 'v3'

      await service.removeBreakpoint(isolateId, breakpoint.id!);
    })
    .run(
      pauseOnExit: true,
      extraArgs: ['--enable-experiment=primary-constructors'],
      testeeMain: testee_lib.main,
    );

// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Every invocation and tearoff of a constructor defined in an
/// extension has a corresponding fully resolved form with all type arguments
/// (if any) fully determined as described in the static semantics above. The
/// dynamic semantics of invocations and tearoffs which are not originally
/// provided in fully resolved form are entirely defined by the dynamic
/// semantics of the corresponding fully resolved form.
///
/// @description Check that a breakpoint can be set in a constructor declared in
/// an extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'static_extensions_t07_lib.dart' as testee_lib;

Future<void> check(
  VmService service,
  IsolateRef isolateRef,
  String expected,
  String expression,
) async {
  final response = await service.evaluateInFrame(isolateRef.id!, 0, expression);
  Expect.isTrue(response is InstanceRef, '$expression: $response');
  Expect.equals(expected, (response as InstanceRef).valueAsString, expression);
}

void main([args = const <String>[]]) =>
    IsolateTestHarness('static_extensions_t07_lib.dart', args)
        .hasStoppedAtBreakpoint()
        // Check that a breakpoint is resolved to the line it was set on.
        .addCustomTestWithParser((
          VmService service,
          IsolateRef isolateRef,
          TestScriptParser parser,
        ) async {
          final isolateId = isolateRef.id!;
          final isolate = await service.getIsolate(isolateId);
          final lib = (await service.getObject(
            isolateId,
            isolate.libraries!
                .firstWhere((l) => l.uri!.contains('static_extensions_t07_lib'))
                .id!,
          )) as Library;
          final scriptId = lib.scripts!.first.id!;

          for (final tag in ['LINE_A', 'LINE_B', 'LINE_C', 'LINE_D']) {
            final breakpoint = await service.addBreakpoint(
              isolateId,
              scriptId,
              parser.lineForTag(tag),
            );
            final (_, (line, _)) = await breakpoint.getLocation(
              service,
              isolateRef,
            );
            Expect.isTrue(breakpoint.enabled);
            Expect.equals(parser.lineForTag(tag), line);
            await service.removeBreakpoint(isolateId, breakpoint.id!);
          }
        })
        // Check that a program stops at the breakpoints.
        .setBreakpointAtLine('LINE_A')
        .setBreakpointAtLine('LINE_B')
        .setBreakpointAtLine('LINE_C')
        .setBreakpointAtLine('LINE_D')
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_A')
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '1', 't');
        })
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_B')
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '2', 't');
        })
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_C')
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '3', 'v');
        })
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_D')
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '4', 'v');
        })
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=static-extensions'],
          testeeMain: testee_lib.main,
        );

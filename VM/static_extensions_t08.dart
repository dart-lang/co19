// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Check that formal parameters, local variables, static members
/// and type parameters of an extension are available in the expression
/// evaluation when a program is stopped in a constructor declared in this
/// extension. Check that they have the expected values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'static_extensions_t08_lib.dart' as testee_lib;

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
    IsolateTestHarness('static_extensions_t08_lib.dart', args)
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_B')
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_A')
        // `C.named(42)`
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '42', 'x');
          await check(service, isolateRef, '2', 'y');
          await check(service, isolateRef, '42', 'local[0]');
          await check(service, isolateRef, 'true', 'T == int');
          await check(service, isolateRef, 'true', '<T>[] is List<int>');
          await check(service, isolateRef, 'true', 'local is List<int>');
          await check(service, isolateRef, 'ExtC', 'staticMember');
          await check(service, isolateRef, 'ExtC', 'C.staticMember');
          await check(service, isolateRef, '1', 'C._(x, local).v2.length');
        })
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_A')
        // `C<num, Object>.named(3.14, y: 3)`. `T` is inferred in the context
        // `C<num, Object>`.
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '3.14', 'x');
          await check(service, isolateRef, '3', 'y');
          await check(service, isolateRef, 'true', 'T == num');
          await check(service, isolateRef, 'true', 'local is List<num>');
          await check(service, isolateRef, 'false', 'local is List<double>');
        })
        .resumeIsolate()
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_A')
        // `ExtC<num>.named(0)`
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '0', 'x');
          await check(service, isolateRef, '2', 'y');
          await check(service, isolateRef, 'true', 'T == num');
          await check(service, isolateRef, 'false', '<T>[] is List<int>');
          await check(service, isolateRef, 'false', 'local is List<int>');
        })
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=static-extensions'],
          testeeMain: testee_lib.main,
        );

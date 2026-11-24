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
/// @description Check that constructors declared in an extension can be invoked
/// and torn off in the expression evaluation. Test generic extensions and
/// generic on-declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'static_extensions_t04_lib.dart' as testee_lib;

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
    IsolateTestHarness('static_extensions_t04_lib.dart', args)
        .hasStoppedAtBreakpoint()
        // No type arguments
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(service, isolateRef, '1', 'Pair.fromList([1, 2]).fst');
          await check(service, isolateRef, '2', 'ExtPair.fromList([1, 2]).snd');
          await check(
            service,
            isolateRef,
            'true',
            'Pair.fromList([1, 2]) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'ExtPair.twice("x") is Pair<String, String>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair.redirecting(1, 2) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair(1) is Pair<int, String>',
          );
          await check(service, isolateRef, '1', 'Pair.new(1).snd');
          await check(
            service,
            isolateRef,
            'true',
            'Pair.bounded(1, "z") is Pair<int, String>',
          );
        })
        // Type arguments on the extension
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(
            service,
            isolateRef,
            'true',
            'ExtPair<num>.fromList([1, 2]) is Pair<num, num>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'ExtPair<num>.fromList([1, 2]) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'ExtPair<num>.twice(1) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'ExtPair<num>.redirecting(1, 2) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'ExtNumPair<num, Object>.bounded(1, "z") is Pair<int, String>',
          );
        })
        // Type arguments on the on-declaration. `Pair<num, int>.name` is a
        // reference to `ExtPair<int>.name`, because the type argument of the
        // extension is inferred in the context `Pair<num, int>`.
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, num>.fromList([1, 2]) is Pair<num, num>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'Pair<num, num>.fromList([1, 2]) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, int>.fromList([1, 2]) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, int>.twice(1) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, int>.redirecting(1, 2) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, Object>(1) is Pair<int, String>',
          );
          await check(
            service,
            isolateRef,
            'false',
            'Pair<num, Object>.bounded(1, "z") is Pair<int, String>',
          );
        })
        // Tear-offs
        .addCustomTest((VmService service, IsolateRef isolateRef) async {
          await check(
            service,
            isolateRef,
            'true',
            'Pair.fromList is Pair<Y, Y> Function<Y>(List<Y>)',
          );
          await check(
            service,
            isolateRef,
            'true',
            'ExtPair.fromList is Pair<Y, Y> Function<Y>(List<Y>)',
          );
          await check(
            service,
            isolateRef,
            'true',
            'ExtPair<int>.fromList is Pair<int, int> Function(List<int>)',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair<num, int>.fromList is Pair<int, int> Function(List<int>)',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair.redirecting is Pair<Y, Y> Function<Y>(Y, Y)',
          );
          await check(
            service,
            isolateRef,
            'true',
            'Pair.bounded is Pair<Y, Z> Function<Y extends num, Z>(Y, Z)',
          );
          await check(
            service,
            isolateRef,
            'false',
            '(Pair.twice)<num>(1) is Pair<int, int>',
          );
          await check(
            service,
            isolateRef,
            'true',
            '(ExtPair<int>.twice)(1) is Pair<int, int>',
          );
        })
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=static-extensions'],
          testeeMain: testee_lib.main,
        );

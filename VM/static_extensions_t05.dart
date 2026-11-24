// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
///
/// A compile-time error occurs if `M` includes extensions with constructors as
/// well as static members.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M` contains
/// two or more elements.
///
/// @description Check that the expression evaluation reports an error if a
/// constructor of an extension cannot be resolved, and that it finds the
/// expected constructor if it can.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'static_extensions_t05_lib.dart' as testee_lib;

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

Future<void> checkError(
  VmService service,
  IsolateRef isolateRef,
  String expression,
) async {
  try {
    await service.evaluateInFrame(isolateRef.id!, 0, expression);
  } on RPCError catch (e) {
    Expect.equals(
      RPCErrorKind.kExpressionCompilationError.code,
      e.code,
      expression,
    );
    return;
  }
  Expect.fail('Compile-time error expected: $expression');
}

void main([
  args = const <String>[],
]) => IsolateTestHarness('static_extensions_t05_lib.dart', args)
    .hasStoppedAtBreakpoint()
    // Name clash can be resolved by an explicit use of the extension name.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtC1.named(1)', 'ExtC1.named("1").id');
      await check(
        service,
        isolateRef,
        'ExtC2.named(2)',
        'ExtC2<int>.named("2").id',
      );
      await check(
        service,
        isolateRef,
        'ExtC1.member(3)',
        'ExtC1.member("3").id',
      );
      await check(service, isolateRef, 'ExtC2.member(4)', 'ExtC2.member("4")');
    })
    // A constructor of the on-declaration wins.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, '1', 'C.own("1").id');
      await check(service, isolateRef, '2', 'C<int>.own("2").id');
      await check(service, isolateRef, 'ExtC1.own(3)', 'ExtC1.own("3").id');
    })
    // Type arguments satisfy the bounds.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(
        service,
        isolateRef,
        'ExtC3.bounded(1)',
        'C<int>.bounded("1").id',
      );
      await check(
        service,
        isolateRef,
        'ExtC3.bounded(2)',
        'ExtC3<num>.bounded("2").id',
      );
    })
    // The on-type of the extension is a subtype of the type used in the
    // invocation.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(
        service,
        isolateRef,
        'ExtC4.nonGeneric(1)',
        'C<num>.nonGeneric("1").id',
      );
      await check(
        service,
        isolateRef,
        'ExtC4.nonGeneric(2)',
        'C.nonGeneric("2").id',
      );
    })
    // Two extensions declare a constructor with the same name.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await checkError(service, isolateRef, 'C.named("1")');
      await checkError(service, isolateRef, 'C<int>.named("1")');
      await checkError(service, isolateRef, 'C.named');
      await checkError(service, isolateRef, 'C<int>.named');
    })
    // One extension declares a constructor and another one a static member.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await checkError(service, isolateRef, 'C.member("1")');
      await checkError(service, isolateRef, 'C<int>.member("1")');
      await checkError(service, isolateRef, 'C.member');
      await checkError(service, isolateRef, 'C<int>.member');
    })
    // There is no such constructor.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await checkError(service, isolateRef, 'C("1")');
      await checkError(service, isolateRef, 'C.new("1")');
      await checkError(service, isolateRef, 'C.unknown("1")');
      await checkError(service, isolateRef, 'ExtC1.unknown("1")');
    })
    // Wrong type arguments.
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await checkError(service, isolateRef, 'ExtC1<int, int>.named("1")');
      await checkError(service, isolateRef, 'C<int, int>.bounded("1")');
      await checkError(service, isolateRef, 'ExtC3<String>.bounded("1")');
      await checkError(service, isolateRef, 'C<String>.nonGeneric("1")');
      await checkError(service, isolateRef, 'ExtC4<int>.nonGeneric("1")');
    })
    .run(
      pauseOnExit: true,
      extraArgs: ['--enable-experiment=static-extensions'],
      testeeMain: testee_lib.main,
    );

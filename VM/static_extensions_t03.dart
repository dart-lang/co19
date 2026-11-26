// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance creation expression of any of the following forms is
/// considered to be a reference to `name`:
/// - `C<TypeArguments>.name(arguments)` where `<TypeArguments>` may be absent
///   and where `name` may be `new`.
/// - `C<TypeArguments>(arguments)` where `<TypeArguments>` may be absent and
///   where `name` is considered to be `new`.
/// ...
/// Let `E` be the unique extension declaration that `M` contains. The fully
/// resolved target of the original invocation or tearoff is then `E.name`.
///
/// @description Check that constructors declared in an extension can be invoked
/// and torn off in the expression evaluation, both via the name of the
/// on-declaration and via the name of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';
import 'static_extensions_t03_lib.dart' as testee_lib;

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

void main([
  args = const <String>[],
]) => IsolateTestHarness('static_extensions_t03_lib.dart', args)
    .hasStoppedAtBreakpoint()
    // Class
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtC(1)', 'C("1").id');
      await check(service, isolateRef, 'ExtC(2)', 'C.new("2").id');
      await check(service, isolateRef, 'ExtC(3)', 'ExtC.new("3").id');
      await check(service, isolateRef, 'ExtC.named(4!)', 'C.named("4").id');
      await check(
        service,
        isolateRef,
        'ExtC.named(5?)',
        'ExtC.named("5", suffix: "?").id',
      );
      await check(service, isolateRef, '6', 'C.redirecting("6").id');
      await check(service, isolateRef, '7', 'ExtC.redirecting("7").id');
    })
    // Mixin class
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtMC(1)', 'MC("1").id');
      await check(service, isolateRef, 'ExtMC(2)', 'MC.new("2").id');
      await check(service, isolateRef, 'ExtMC(3)', 'ExtMC.new("3").id');
      await check(service, isolateRef, 'ExtMC.named(4!)', 'MC.named("4").id');
      await check(
        service,
        isolateRef,
        'ExtMC.named(5?)',
        'ExtMC.named("5", "?").id',
      );
    })
    // Mixin
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtM(1)', 'M("1").id');
      await check(service, isolateRef, 'ExtM(2)', 'M.new("2").id');
      await check(service, isolateRef, 'ExtM(3)', 'ExtM.new("3").id');
      await check(service, isolateRef, 'ExtM.named(4)', 'M.named("4").id');
      await check(service, isolateRef, 'ExtM.named(5)', 'ExtM.named("5").id');
      await check(service, isolateRef, '6', 'M.redirecting("6").id');
      await check(service, isolateRef, '7', 'ExtM.redirecting("7").id');
    })
    // Enum
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'e0', 'E(0).id');
      await check(service, isolateRef, 'e1', 'E.new(1).id');
      await check(service, isolateRef, 'e0', 'ExtE.new(0).id');
      await check(service, isolateRef, 'e1', 'E.named("e1").id');
      await check(service, isolateRef, 'e0', 'ExtE.named("e0").id');
    })
    // Extension type
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtET(1)', 'ET("1").id');
      await check(service, isolateRef, 'ExtET(2)', 'ET.new("2").id');
      await check(service, isolateRef, 'ExtET(3)', 'ExtET.new("3").id');
      await check(service, isolateRef, 'ExtET.named(4)', 'ET.named("4").id');
      await check(service, isolateRef, 'ExtET.named(5)', 'ExtET.named("5").id');
      await check(service, isolateRef, '6', 'ET.redirecting("6").id');
      await check(service, isolateRef, '7', 'ExtET.redirecting("7").id');
    })
    // Tear-offs
    .addCustomTest((VmService service, IsolateRef isolateRef) async {
      await check(service, isolateRef, 'ExtC(1)', '(C.new)("1").id');
      await check(service, isolateRef, 'ExtC.named(2!)', '(C.named)("2").id');
      await check(
        service,
        isolateRef,
        'ExtC.named(3!)',
        '(ExtC.named)("3").id',
      );
      await check(service, isolateRef, '4', '(C.redirecting)("4").id');
      await check(service, isolateRef, 'ExtMC.named(5!)', '(MC.named)("5").id');
      await check(service, isolateRef, 'ExtM(6)', '(M.new)("6").id');
      await check(service, isolateRef, 'e1', '(E.new)(1).id');
      await check(service, isolateRef, 'ExtET.named(7)', '(ET.named)("7").id');
      await check(
        service,
        isolateRef,
        'true',
        'C.named is C Function(String, {String suffix})',
      );
    })
    .run(
      pauseOnExit: true,
      extraArgs: ['--enable-experiment=static-extensions'],
      testeeMain: testee_lib.main,
    );

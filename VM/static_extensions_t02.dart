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
/// @description Check that `C.m()` is treated as `E.m()`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'dart:developer';
import 'package:vm_service/vm_service.dart';

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import '../Utils/expect.dart';

void main([args = const <String>[]]) =>
    IsolateTestHarness('static_extensions_t02_lib.dart', args)
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_B')
        .stepInto()
        .stoppedAtLine('LINE_C')
        .stepInto()
        .stoppedAtLine('LINE_A')
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=static-extensions'],
        );

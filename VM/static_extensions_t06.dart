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
/// @description Check that it is possible to step into a constructor declared
/// in an extension. Test invocations via the name of the on-declaration, via
/// the name of the extension and via a tear-off.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../../../pkg/vm_service/test/common/service_test_common.dart';
import 'static_extensions_t06_lib.dart' as testee_lib;

void main([args = const <String>[]]) =>
    IsolateTestHarness('static_extensions_t06_lib.dart', args)
        .hasStoppedAtBreakpoint()
        .stoppedAtLine('LINE_D')
        .stepOver()
        .stoppedAtLine('LINE_E')
        .stepInto()
        .stoppedAtLine('LINE_B')
        .stepOut()
        .stoppedAtLine('LINE_F')
        .stepInto()
        .stoppedAtLine('LINE_B')
        .stepOut()
        .stoppedAtLine('LINE_G')
        .stepInto()
        .stoppedAtLine('LINE_C')
        .stepOut()
        .stoppedAtLine('LINE_H')
        .stepInto()
        .stoppedAtLine('LINE_C')
        .stepOut()
        .stoppedAtLine('LINE_I')
        .stepOver()
        .stoppedAtLine('LINE_J')
        .stepInto()
        .stoppedAtLine('LINE_C')
        .stepOut()
        // Stepping into a redirecting factory should stop in its redirectee.
        .stoppedAtLine('LINE_K')
        .stepInto()
        .stoppedAtLine('LINE_A')
        .stepOut()
        .stoppedAtLine('LINE_L')
        .stepInto()
        .stoppedAtLine('LINE_A')
        .stepOut()
        .stoppedAtLine('LINE_M')
        .run(
          pauseOnExit: true,
          extraArgs: ['--enable-experiment=static-extensions'],
          testeeMain: testee_lib.main,
        );

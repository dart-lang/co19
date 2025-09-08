// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// @JS('call')
/// JSAny? callAsFunction([
///   JSAny? thisArg,
///   JSAny? arg1,
///   JSAny? arg2,
///   JSAny? arg3,
///   JSAny? arg4,
/// ])
/// Call this [JSFunction] using the JavaScript `.call` syntax and returns the
/// result.
///
/// Takes at most 4 args for consistency with other APIs and relative brevity.
/// If more are needed, you can declare your own external member with the same
/// syntax.
///
/// @description Check that this method calls this JS function and returns the
/// result. Check the value of `thisArg`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

String foo(JSObject pThis, int p1, String p2, double p3, bool p4) {
  return "$pThis, $p1, $p2, $p3, $p4";
}

main() {
  globalContext["jsFoo"] = foo.toJSCaptureThis;
  JSFunction jsFoo = globalContext["jsFoo"] as JSFunction;
  var res = jsFoo.callAsFunction(
    "Value of this".toJS,
    1.toJS,
    "two".toJS,
    3.14.toJS,
    true.toJS,
  );
  Expect.equals("Value of this, 1, two, 3.14, true", (res as JSString).toDart);
}

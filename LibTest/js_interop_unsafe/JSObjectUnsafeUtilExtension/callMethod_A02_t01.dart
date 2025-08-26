// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion R callMethod<R extends JSAny?>(
/// JSAny method, [
/// JSAny? arg1,
/// JSAny? arg2,
/// JSAny? arg3,
/// JSAny? arg4,
/// ])
///
/// Calls method on this [JSObject] with up to four arguments.
///
/// Returns the result of calling method, which must be an `R`.
///
/// This helper doesn't allow passing nulls, as it determines whether an
/// argument is passed based on whether it was null or not. Prefer
/// [callMethodVarArgs] if you need to pass nulls.
///
/// @description Check that it is a run-time error if the object doesn't
/// have an appropriate member.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    class MyJsObject {
      foo() {
        return "foo";
      }
    }
    globalThis.object = new MyJsObject();
  ''');
  var obj = globalContext["object"] as JSObject;
  Expect.throws(() {
    obj.callMethod<JSString>("bar".toJS);
  });
}

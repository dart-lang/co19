// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// R callMethodVarArgs<R extends JSAny?>(JSAny method, [List<JSAny?>? arguments])
/// Calls method on this [JSObject] with a variable number of arguments.
///
/// Returns the result of calling method, which must be an `R`.
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
        return "foo() from JS";
      }
    }
    globalThis.object = new MyJsObject();
  ''');
  var obj = globalContext["object"] as JSObject;
  Expect.equals("foo() from JS",
      (obj.callMethodVarArgs<JSString>("foo".toJS) as JSString).toDart);
  Expect.throws(() {
    obj.callMethodVarArgs<JSString>("bar".toJS);
  });
}

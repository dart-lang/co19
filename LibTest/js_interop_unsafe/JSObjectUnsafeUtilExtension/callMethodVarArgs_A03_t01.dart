// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// R callMethodVarArgs<R extends JSAny?>(JSAny method, [List<JSAny?>? arguments])
/// Calls method on this [JSObject] with a variable number of arguments.
///
/// Returns the result of calling method, which must be an `R`.
///
/// @description Check that passing nulls is allowed.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external bool get a1;
  external bool get a2;
}

main() {
  eval(r'''
    class MyJsObject {
      m(v) {
        this.a1 = v === undefined;
        this.a2 = v === null;
        return this;
      }
    }
    globalThis.object = new MyJsObject();
  ''');
  var obj = globalContext["object"] as JSObject;
  ET et = obj.callMethodVarArgs<ET>("m".toJS, [null]);
  Expect.isFalse(et.a1);
  Expect.isTrue(et.a2);
}

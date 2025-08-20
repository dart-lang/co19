// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// R callAsConstructorVarArgs<R extends JSObject>([ List<JSAny?>? arguments ])
///
/// Calls this [JSFunction] as a constructor with a variable number of arguments
///
/// Returns the constructed JSObject, which must be an `R`.
///
/// @description Check that `null`s are allowed and not converted to `undefined`
/// in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

@JS("MyJsClass")
extension type ET._(JSObject _) implements JSObject {
  external bool get a1;
  external bool get a2;
}

main() {
  eval(r'''
    class MyJsClass {
      constructor(v1) {
        this.a1 = v1 === undefined;
        this.a2 = v1 === null;
      }
    }
    globalThis.MyJsClass = MyJsClass;
  ''');
  var constructor = globalContext["MyJsClass"] as JSFunction;
  ET et = constructor.callAsConstructorVarArgs<ET>([null]);
  Expect.isFalse(et.a1);
  Expect.isTrue(et.a2);
}

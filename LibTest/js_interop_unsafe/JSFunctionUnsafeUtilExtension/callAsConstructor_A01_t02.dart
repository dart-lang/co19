// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion R callAsConstructor<R>(
///     [JSAny? arg1, JSAny? arg2, JSAny? arg3, JSAny? arg4,])
///
/// Calls this [JSFunction] as a constructor with up to four arguments.
///
/// Returns the constructed object, which must be an `R`.
///
/// @description Check that this function returns the constructed object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

@JS("MyJsClass")
extension type ET._(JSObject _) implements JSObject {
  external int get a1;
  external String get a2;
  external String get a3;
  external bool get a4;
}

main() {
  eval(r'''
    function MyJsClass(a1, a2, a3, a4) {
      this.a1 = a1;
      this.a2 = a2;
      this.a3 = a3;
      this.a4 = a4;
    }
    globalThis.MyJsClass = MyJsClass;
  ''');
  var constructor = globalContext["MyJsClass"] as JSFunction;
  ET et = constructor.callAsConstructor<ET>(
    1.toJS,
    "two".toJS,
    "three".toJS,
    true.toJS,
  );
  Expect.equals(1, et.a1);
  Expect.equals("two", et.a2);
  Expect.equals("three", et.a3);
  Expect.equals(true, et.a4);
}

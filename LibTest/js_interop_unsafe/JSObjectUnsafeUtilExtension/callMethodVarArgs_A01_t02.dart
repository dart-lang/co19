// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// R callMethodVarArgs<R extends JSAny?>(JSAny method, [List<JSAny?>? arguments])
/// Calls method on this [JSObject] with a variable number of arguments.
///
/// Returns the result of calling method, which must be an `R`.
///
/// @description Check that this function calls a method on this [JSObject] and
/// returns an expected value.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    class MyJsObject {
      foo(v) {
        return v;
      }
    }
    globalThis.object = new MyJsObject();
    globalThis.bi = 42n;
    globalThis.smb = Symbol("name");
  ''');
  var obj = globalContext["object"] as JSObject;
  JSString v1 = obj.callMethodVarArgs<JSString>("foo".toJS, ["x".toJS]);
  Expect.equals("x", v1.toDart);

  JSNumber v2 = obj.callMethodVarArgs<JSNumber>("foo".toJS, [42.toJS]);
  Expect.equals(42, v2.toDartInt);

  JSNumber v3 = obj.callMethodVarArgs<JSNumber>("foo".toJS, [3.14.toJS]);
  Expect.equals(3.14, v3.toDartDouble);

  JSBoolean v4 = obj.callMethodVarArgs<JSBoolean>("foo".toJS, [false.toJS]);
  Expect.isFalse(v4.toDart);

  JSBigInt bi = globalContext["bi"] as JSBigInt;
  JSBigInt v5 = obj.callMethodVarArgs<JSBigInt>("foo".toJS, [bi]);
  Expect.equals(bi, v5);

  JSSymbol smb = globalContext["smb"] as JSSymbol;
  JSSymbol v6 = obj.callMethodVarArgs<JSSymbol>("foo".toJS, [smb]);
  Expect.equals(smb, v6);
}

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
  JSString v1 = obj.callMethod<JSString>("foo".toJS, "x".toJS);
  Expect.equals("x", v1.toDart);

  JSNumber v2 = obj.callMethod<JSNumber>("foo".toJS, 42.toJS);
  Expect.equals(42, v2.toDartInt);

  JSNumber v3 = obj.callMethod<JSNumber>("foo".toJS, 3.14.toJS);
  Expect.equals(3.14, v3.toDartDouble);

  JSBoolean v4 = obj.callMethod<JSBoolean>("foo".toJS, false.toJS);
  Expect.isFalse(v4.toDart);

  JSBigInt bi = globalContext["bi"] as JSBigInt;
  JSBigInt v5 = obj.callMethod<JSBigInt>("foo".toJS, bi);
  Expect.equals(bi, v5);

  JSSymbol smb = globalContext["smb"] as JSSymbol;
  JSSymbol v6 = obj.callMethod<JSSymbol>("foo".toJS, smb);
  Expect.equals(smb, v6);
}

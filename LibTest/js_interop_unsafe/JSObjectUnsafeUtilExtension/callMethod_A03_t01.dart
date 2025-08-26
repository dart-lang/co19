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
/// @description Check that passing nulls is allowed but in JS these values
/// became `undefined`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external int? get a1;
  external String? get a2;
  external String? get a3;
  external bool get a4;
}

main() {
  eval(r'''
    class MyJsObject {
      m(a1, a2, a3, a4) {
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4 === undefined;
        return this;
      }
    }
    globalThis.object = new MyJsObject();
  ''');
  var obj = globalContext["object"] as JSObject;
  ET et = obj.callMethod<ET>("m".toJS, null, null, null, null);
  Expect.isNull(et.a1);
  Expect.isNull(et.a2);
  Expect.isNull(et.a3);
  Expect.isTrue(et.a4);
}

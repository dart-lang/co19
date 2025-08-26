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
/// @description Check that this function returns the constructed object. Test
/// the case when JS function returns an object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

@JS("Foo")
extension type ET._(JSObject _) implements JSObject {
  external int? get a1;
  external String? get a2;
  external String? get a3;
  external bool? get a4;
  external double? get a5;
}

main() {
  eval(r'''
    function Foo() {
      var o = {
        a1: 1,
        a2: "two",
        a3: "three",
        a4: true
      };
      return o;
    }
    globalThis.Foo = Foo;
  ''');
  var constructor = globalContext["Foo"] as JSFunction;
  ET et = constructor.callAsConstructorVarArgs<ET>([
    1.toJS,
    "two".toJS,
    "three".toJS,
    true.toJS,
    3.14.toJS,
  ]);
  Expect.isFalse(et.instanceOfString("Foo"));
  Expect.equals(1, et.a1);
  Expect.equals("two", et.a2);
  Expect.equals("three", et.a3);
  Expect.isTrue(et.a4);
}

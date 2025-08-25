// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// R callMethodVarArgs<R extends JSAny?>(JSAny method, [List<JSAny?>? arguments])
/// Calls method on this [JSObject] with a variable number of arguments.
///
/// Returns the result of calling method, which must be an `R`.
///
/// @description Check that this function calls a method on this [JSObject].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external int get a1;
  external String get a2;
  external String get a3;
  external bool get a4;
  external double get a5;
}

main() {
  eval(r'''
    class MyJsObject1 {
      m(a1, a2, a3, a4, a5) {
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.a5 = a5;
        return this;
      }
    }
    globalThis.object1 = new MyJsObject1();
    
    function MyJsObject2() {
      this.m = function(a1, a2, a3, a4, a5) {
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.a5 = a5;
        return this;
      }
    }
    globalThis.object2 = new MyJsObject2();
  ''');
  var obj1 = globalContext["object1"] as JSObject;
  ET et = obj1.callMethodVarArgs<ET>("m".toJS, [
    1.toJS,
    "two".toJS,
    "three".toJS,
    true.toJS,
    3.14.toJS,
  ]);
  Expect.equals(1, et.a1);
  Expect.equals("two", et.a2);
  Expect.equals("three", et.a3);
  Expect.equals(true, et.a4);
  Expect.equals(3.14, et.a5);

  var obj2 = globalContext["object2"] as JSObject;
  ET et2 = obj2.callMethodVarArgs<ET>("m".toJS, [
    2.toJS,
    "three".toJS,
    "four".toJS,
    false.toJS,
    3.14.toJS,
  ]);
  Expect.equals(2, et2.a1);
  Expect.equals("three", et2.a2);
  Expect.equals("four", et2.a3);
  Expect.equals(false, et2.a4);
  Expect.equals(3.14, et2.a5);
}

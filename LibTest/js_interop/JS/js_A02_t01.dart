// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that an extension type with external members can be
/// annotated with `@JS()` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type ET(JSObject _) implements JSObject {
  external int var1;

  external String var2;

  external int get x;

  external void set x(int v);

  external int f1();

  external int f2(int v);
}

main() {
  eval(r'''
    class ET {
      constructor(v1, v2) {
        this.var1 = v1;
        this.var2 = v2;
        this._x = 0;
      }
      
      get x() {
        return this._x;
      }
      
      set x(v) {
        this._x = v;
      }
      
      f1() {
        return this.var1;
      }
      
      f2(v) {
        return v;
      }
    }
    globalThis.et = new ET(1, "two");
  ''');

  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(1, et.var1);
  Expect.equals("two", et.var2);
  Expect.equals(0, et.x);
  Expect.equals(1, et.f1());
  Expect.equals(2, et.f2(2));
  et.x = 3;
  Expect.equals(3, et.x);
}

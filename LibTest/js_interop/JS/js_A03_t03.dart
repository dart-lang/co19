// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
/// ...
/// Specifying name customizes the JavaScript name to use, which can be used in
/// the following scenarios:
/// - Adding a JavaScript prefix to all the external top-level declarations,
///   static members, and constructors of a library by parameterizing the
///   annotation on the library with `name`.
/// - Specifying the JavaScript class to use for external static members and
///   constructors of an interop extension type by parameterizing the annotation
///   on the interop extension type with `name`.
/// - Renaming external declarations by parameterizing the annotation on the
///   member with `name`.
///
/// @description Check that specifying `name` customizes the JavaScript `name`
/// to use. Test members of an extension type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

extension type ET(JSObject _) implements JSObject {
  @JS("jsVar1")
  external int var1;

  @JS("jsVar2")
  external final String var2;

  @JS("jsX")
  external int get x;

  @JS("jsX")
  external void set x(int v);

  @JS("jsF1")
  external int f1();

  @JS("jsF2")
  external int f2(int v);
}

main() {
  eval(r'''
    class ET {
      constructor(v1, v2) {
        this.jsVar1 = v1;
        this.jsVar2 = v2;
        this._x = 0;
      }
      
      get jsX() {
        return this._x;
      }
      
      set jsX(v) {
        this._x = v;
      }
      
      jsF1() {
        return this.jsVar1;
      }
      
      jsF2(v) {
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

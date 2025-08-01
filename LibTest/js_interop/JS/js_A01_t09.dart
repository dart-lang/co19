// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that an extension without a `@JS()` annotation can be
/// applied to JS interop extension type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

extension type ET(JSObject o) implements JSObject {
  external int foo();
}

extension Ext1 on ET {
  external int bar();

  external String get id1;
  external void set id1(String _);
}

main() {
  eval(r'''
    class ET {
      ET() {
        this._id1 = ""; 
        this._id2 = ""; 
      }
      foo() {
        return 1;
      }
      bar() {
        return 2;
      }
      get id1() {
        return this._id1;
      }
      set id1(v) {
        this._id1 = v;
      }
    }  
    globalThis.et = new ET();
  ''');

  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(1, et.foo());
  Expect.equals(2, et.bar());
  et.id1 = "id1";
  Expect.equals("id1", et.id1);
}

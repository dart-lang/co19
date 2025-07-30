// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that JS interop extension type may have a type parameter.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type ET1<T extends JSAny>(JSObject _) implements JSObject {
  external T f1();
}

@JS()
extension type ET2<T extends JSObject>(JSObject _) implements JSObject {
  external T g1();
}

main() {
  eval(r'''
    class ET1 {
      f1() {
        return 1;
      }
    }
    class ET2 {
      g1() {
        return ["two"];
      }
    }
    globalThis.et1 = new ET1();
    globalThis.et2 = new ET2();
  ''');
  ET1<JSNumber> et1 = globalContext["et1"] as ET1<JSNumber>;
  Expect.equals(1, et1.f1().toDartInt);

  ET2<JSArray> et2 = globalContext["et2"] as ET2<JSArray>;
  if (isWasm) {
    var arr = et2.g1().toDart; // List<JSValue?>
    Expect.equals(1, arr.length);
    // JSValue cannot be converted to String on Wasm.
    // Let's check its string representation
    Expect.equals("two", arr[0].toString());
  } else {
    Expect.listEquals(["two"], et2.g1().toDart);
  }
}

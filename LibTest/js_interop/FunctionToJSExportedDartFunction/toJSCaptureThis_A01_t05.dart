// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJSCaptureThis
/// A callable JavaScript function that wraps this [Function] and captures the
/// `this` value when called.
///
/// Identical to `toJS`, except the resulting [JSExportedDartFunction] will pass
/// `this` from JavaScript as the first argument to the converted [Function].
/// Any [Function] that is converted with this member should take in an extra
/// parameter at the beginning of the parameter list to handle this.
///
/// @description Check that this property returns a JavaScript function that
/// wraps this Dart [Function]. Test [ExternalDartReference] and JS interop type
/// as arguments.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external factory ET();
  external String get id;
}

class C {
  String _id;
  C(this._id);
  String id() => _id;
}

ExternalDartReference<C> foo(pThis, ExternalDartReference<C> c) {
  Expect.equals(globalContext, pThis);
  return c;
}

ET bar(pThis, ET et) {
  Expect.equals(globalContext, pThis);
  return et;
}

@JS()
external void passCtoJS(ExternalDartReference<C> c);

main() {
  eval(r'''
    class ET {
      get id() {
        return "ET from JS";
      }  
    }
    globalThis.ET = ET;
    
    function passCtoJS(c) {
      globalThis.jsC = c;
    }
  ''');
  C c = C("C from Dart");
  passCtoJS(c.toExternalReference);
  globalContext["jsFoo"] = foo.toJSCaptureThis;
  eval("globalThis.res1 = globalThis.jsFoo(globalThis.jsC);");
  Expect.equals(
    "C from Dart",
    (globalContext["res1"] as ExternalDartReference<C>).toDartObject.id(),
  );

  globalContext["jsBar"] = bar.toJSCaptureThis;
  globalContext["jsET"] = ET();
  eval("globalThis.res2 = globalThis.jsBar(globalThis.jsET);");
  Expect.equals("ET from JS", (globalContext["res2"] as ET).id);
}

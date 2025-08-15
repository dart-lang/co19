// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain JS types from
/// 'dart:js_interop' in its signature.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET.c(JSNumber v1);
  external factory ET.f(JSNumber v1, JSBigInt v2);

  external JSNumber v1;
  external JSBigInt v2;
  external JSString v;
  external JSBoolean foo();
  external void bar(JSString _);
  external JSSymbol baz(JSSymbol _);
}

main() {
  eval(r'''
    class ET {
      constructor(v1, v2) {
        this.v1 = v1;
        this.v2 = v2;
      }
      foo() {
        return true;
      }
      bar(v) {
        this.v = v;
      }
      baz(val) {
        return val;
      }
    }
    globalThis.ET = ET;
    globalThis.bi = 123n;
    globalThis.smb = Symbol('$name');
  ''');
  ET et1 = ET.c(1.toJS);
  Expect.equals(1, et1.v1.toDartInt);
  Expect.isTrue(et1.foo().toDart);
  et1.bar("x".toJS);
  Expect.equals("x", et1.v.toDart);

  ET et2 = ET.f(2.toJS, (globalContext["bi"] as JSBigInt));
  Expect.equals(2, et2.v1.toDartInt);
  Expect.equals(123.toString(), et2.v2.toString());
  var smb = globalContext["smb"] as JSSymbol;
  Expect.equals(smb, et2.baz(smb));
}

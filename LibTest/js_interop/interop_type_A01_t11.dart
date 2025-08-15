// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain a type
/// parameter that is a subtype of a valid non-primitive type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET<T extends JSObject>._(JSObject _) implements JSObject {
  external ET.c(T t);

  external T foo();
  external T bar(T _);
}

@JS("ET")
extension type ET2<T extends JSObject>._(JSObject _) implements JSObject {
  external factory ET2(T t);

  external T foo();
  external T bar(T _);
}

@JS("ET")
extension type ET3<T extends JSAny>._(JSObject _) implements JSObject {
  external ET3(T t);

  external T foo();
  external T bar(T _);
}

main() {
  eval(r'''
    class ET {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        return v;
      }
    }
    globalThis.ET = ET;
  ''');
  JSArray<JSNumber> arr = JSArray<JSNumber>.withLength(1);
  arr[0] = 42.toJS;
  ET<JSArray> et = ET.c(arr);
  Expect.equals(42, (et.foo()[0] as JSNumber).toDartInt);
  var ar2 = et.bar(arr);
  Expect.equals(42, (ar2[0] as JSNumber).toDartInt);

  ET2<JSArray> et2 = ET2(arr);
  Expect.equals(42, (et2.foo()[0] as JSNumber).toDartInt);

  ET3<JSNumber> et3 = ET3(42.toJS);
  Expect.equals(42, (et3.foo() as JSNumber).toDartInt);
  var v3 = et3.bar(1.toJS);
  Expect.equals(1, (v3 as JSNumber).toDartInt);
}

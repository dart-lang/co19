// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - Object literal constructors. It's sometimes useful to create a JS object
///   literal that simply contains a number of properties and their values. In
///   order to do this, declare a constructor with only named parameters, where
///   the names of the parameters match the property names.
///
/// @description Check that a constructor of a JS interop type with named
/// parameters creates a new JS object with all properties defined by the
/// constructor. Test redirecting constructors.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET1._(JSObject _) implements JSObject {
  external ET1({int id, String? name});
  ET1.fromId({int id = 0}) : this(id: id, name: "default");

  external int get id;
  external String? get name;
}

extension type ET2._(JSObject _) implements JSObject {
  external factory ET2({int id, String? name});
  factory ET2.f({int id = 0}) => ET2(id: id, name: "default");
  factory ET2.fromId({int id}) = ET2.f;

  external int get id;
  external String? get name;
}

main() {
  globalContext["et1"] = ET1.fromId(id: 1);
  eval(r'''
    globalThis.v1 = globalThis.et1.id;
    globalThis.v2 = globalThis.et1.name;
  ''');
  Expect.equals(1, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("default", (globalContext["v2"] as JSString).toDart);

  globalContext["et2"] = ET2.f(id: 2);
  eval(r'''
    globalThis.v3 = globalThis.et2.id;
    globalThis.v4 = globalThis.et2.name;
  ''');
  Expect.equals(2, (globalContext["v3"] as JSNumber).toDartInt);
  Expect.equals("default", (globalContext["v4"] as JSString).toDart);

  globalContext["et3"] = ET2.fromId(id: 3);
  eval(r'''
    globalThis.v5 = globalThis.et3.id;
    globalThis.v6 = globalThis.et3.name;
  ''');
  Expect.equals(3, (globalContext["v5"] as JSNumber).toDartInt);
  Expect.equals("default", (globalContext["v6"] as JSString).toDart);
}

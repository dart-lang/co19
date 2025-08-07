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
/// constructor. Test required named parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET1._(JSObject _) implements JSObject {
  external ET1({required int id, required String? name});
  external ET1.fromId({required int id});

  external int get id;
  external String? get name;
}

extension type ET2._(JSObject _) implements JSObject {
  external factory ET2({required int id, required String? name});
  external factory ET2.fromId({required int id});

  external int get id;
  external String? get name;
}

main() {
  globalContext["et1"] = ET1(id: 1, name: "one");
  eval(r'''
    globalThis.v1 = globalThis.et1.id;
    globalThis.v2 = globalThis.et1.name;
  ''');
  Expect.equals(1, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("one", (globalContext["v2"] as JSString).toDart);

  globalContext["et2"] = ET1.fromId(id: 2);
  eval(r'''
    globalThis.v3 = globalThis.et2.id;
    globalThis.v4 = globalThis.et2.name;
  ''');
  Expect.equals(2, (globalContext["v3"] as JSNumber).toDartInt);
  Expect.isNull(globalContext["v4"]);

  globalContext["et3"] = ET2(id: 3, name: "three");
  eval(r'''
    globalThis.v5 = globalThis.et3.id;
    globalThis.v6 = globalThis.et3.name;
  ''');
  Expect.equals(3, (globalContext["v5"] as JSNumber).toDartInt);
  Expect.equals("three", (globalContext["v6"] as JSString).toDart);

  globalContext["et4"] = ET2.fromId(id: 4);
  eval(r'''
    globalThis.v7 = globalThis.et4.id;
    globalThis.v8 = globalThis.et4.name;
  ''');
  Expect.equals(4, (globalContext["v7"] as JSNumber).toDartInt);
  Expect.isNull(globalContext["v8"]);
}

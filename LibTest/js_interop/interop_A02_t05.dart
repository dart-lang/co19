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
/// @description Check that default values of a constructor of a JS interop type
/// with named parameters are ignored.
/// @author sgrekhov22@gmail.com
/// @issue 61289

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET1._(JSObject _) implements JSObject {
  external ET1({int id = 0, String name = "default"});

  external int? get id;
  external String? get name;
}

extension type ET2._(JSObject _) implements JSObject {
  external factory ET2({int id = 0, String name = "default"});

  external int? get id;
  external String? get name;
}

main() {
  globalContext["et1"] = ET1();
  eval(r'''
    globalThis.v1 = globalThis.et1.id;
    globalThis.v2 = globalThis.et1.name;
  ''');
  Expect.isNull(globalContext["v1"]);
  Expect.isNull(globalContext["v2"]);

  globalContext["et2"] = ET1(id: 2);
  eval(r'''
    globalThis.v3 = globalThis.et2.id;
    globalThis.v4 = globalThis.et2.name;
  ''');
  Expect.equals(2, (globalContext["v3"] as JSNumber).toDartInt);
  Expect.isNull(globalContext["v4"]);

  globalContext["et3"] = ET2();
  eval(r'''
    globalThis.v5 = globalThis.et3.id;
    globalThis.v6 = globalThis.et3.name;
  ''');
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);

  globalContext["et4"] = ET2(id: 4);
  eval(r'''
    globalThis.v7 = globalThis.et4.id;
    globalThis.v8 = globalThis.et4.name;
  ''');
  Expect.equals(4, (globalContext["v7"] as JSNumber).toDartInt);
  Expect.isNull(globalContext["v8"]);
}

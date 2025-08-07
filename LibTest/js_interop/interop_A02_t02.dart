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
/// @description Check that invoking a constructor of a JS interop type creates
/// a new JS object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET1._(JSObject _) implements JSObject {
  external ET1({int id, String? name});

  external int get id;
  external String? get name;
}

extension type ET2._(JSObject _) implements JSObject {
  external factory ET2({int id, String? name});

  external int get id;
  external String? get name;
}

main() {
  globalContext["et1"] = ET1(id: 1, name: "one");
  globalContext["et2"] = ET1(id: 1, name: "one");
  eval("globalThis.res1 = globalThis.et1 == globalThis.et2;");
  Expect.isFalse((globalContext["res1"] as JSBoolean).toDart);

  globalContext["et3"] = ET2(id: 2, name: "two");
  globalContext["et4"] = ET2(id: 2, name: "two");
  eval("globalThis.res2 = globalThis.et3 == globalThis.et4;");
  Expect.isFalse((globalContext["res2"] as JSBoolean).toDart);
}

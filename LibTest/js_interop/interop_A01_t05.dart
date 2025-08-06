// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that invoking constructor of a JS interop type creates a
/// new JS object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);

  external int get id;
  external String? get name;
}

main() {
  eval(r'''
    class ET {
      constructor(id, name) {
        this._id = id;
        this._name = name;
      }
      get id() {
        return this._id;
      }
      get name() {
        return this._name;
      }
    }
    globalThis.ET = ET;
  ''');
  globalContext["et1"] = ET(1, "one");
  globalContext["et2"] = ET(1, "one");
  eval("globalThis.res1 = globalThis.et1 == globalThis.et2;");
  Expect.isFalse((globalContext["res1"] as JSBoolean).toDart);

  globalContext["et3"] = ET2(2, "two");
  globalContext["et4"] = ET2(2, "two");
  eval("globalThis.res2 = globalThis.et3 == globalThis.et4;");
  Expect.isFalse((globalContext["res2"] as JSBoolean).toDart);
}

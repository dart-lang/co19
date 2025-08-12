// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that default values of an external constructor of a JS
/// interop type are ignored.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET([int? id = 0, String? name = "default"]);

  external int? get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2([int? id = 0, String? name = "default"]);

  external int? get id;
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
  ET et1 = ET();
  Expect.isNull(et1.id);
  Expect.isNull(et1.name);

  ET et2 = ET(2);
  Expect.equals(2, et2.id);
  Expect.isNull(et2.name);

  ET2 et3 = ET2();
  Expect.isNull(et3.id);
  Expect.isNull(et3.name);

  ET2 et4 = ET2(4);
  Expect.equals(4, et4.id);
  Expect.isNull(et4.name);
}

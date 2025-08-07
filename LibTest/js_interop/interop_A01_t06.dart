// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that a constructor of JS interop type with positional
/// parameters when called creates a new JS object whose constructor is defined
/// by the name of the extension type using `new`. Test redirecting constructor.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);
  ET.fromId(int id) : this(id, "default");

  external int get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);
  factory ET2.f(int id) => ET2(id, "default");
  factory ET2.fromId(int id) = ET2.f;

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

  ET et1 = ET.fromId(1);
  Expect.equals(1, et1.id);
  Expect.equals("default", et1.name);

  ET2 et2 = ET2.f(2);
  Expect.equals(2, et2.id);
  Expect.equals("default", et2.name);

  ET2 et3 = ET2.fromId(3);
  Expect.equals(3, et3.id);
  Expect.equals("default", et3.name);
}

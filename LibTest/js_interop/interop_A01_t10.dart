// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that a constructor of a JS interop type with positional
/// parameters when called creates a new JS object whose constructor is defined
/// by the name of the extension type using `new`. Test the case when JS type
/// contains a static member with the same name.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET.create(int id, String? name);

  external int? get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2.create(int id, String? name);

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
      static create(id, name) {
        return 42;
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
  ET et1 = ET.create(1, "one");
  Expect.equals(1, et1.id);
  Expect.equals("one", et1.name);

  ET2 et2 = ET2.create(2, "two");
  Expect.equals(2, et2.id);
  Expect.equals("two", et2.name);
}

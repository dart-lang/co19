// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that a primary constructor of a JS interop type is not
/// external and therefore its invocation does not call a JS constructor.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET(JSAny v) implements JSAny {
  external ET.create(int id, String? name);

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

  ET et1 = ET(42.toJS);
  Expect.isNull(et1.id);
  Expect.isNull(et1.name);
}

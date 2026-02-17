// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can also write external members in extensions of interop
/// types.
///
/// @description Check that external members in extensions of interop types are
/// allowed and work as expected.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS("ET")
extension type ET._(JSObject _) implements JSObject {
  external factory ET(int id, String? name);

  external int get id;
}

extension Ext on ET {
  external String? get getName;
  int getAnswer();
}

augment extension Ext {
  @JS("name")
  String? get getName;
  @JS("answer")
  external int getAnswer();
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
      answer() {
        return 42;
      }
    }
    globalThis.ET = ET;
  ''');

  ET et = ET(2, "two");
  Expect.equals(2, et.id);
  Expect.equals("two", et.getName);
  Expect.equals(42, et.getAnswer());
}

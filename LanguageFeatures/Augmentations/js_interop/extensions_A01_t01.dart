// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Extension declarations can be augmented.
///
/// @description Checks that an js interop extension can be augmented.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int get id;
}

extension Ext on ET {
  int answer();
}

augment extension Ext {
  augment external int answer();
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
      answer() {
        return 42;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et = ET(1, "one");
  Expect.equals(1, et.id);
  Expect.equals("one", et.name);
  Expect.equals(42, et.answer());
}

// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interop types should also generally implement their
/// representation type so that they can be used where the representation type
/// is expected, like in many APIs provided by package:web.
///
/// @description Check that a JS interop extension type is allowed to not
/// implement the representation type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) {
  external ET(int id, String? name);
  external ET.fromId(int id);

  external int get id;
  external String? get name;
}

@JS("ET")
extension type ET2._(JSObject _) {
  external factory ET2(int id, String? name);
  external factory ET2.fromId(int id);

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
  ET et1 = ET(1, "one");
  Expect.equals(1, et1.id);
  Expect.equals("one", et1.name);

  ET et2 = ET.fromId(2);
  Expect.equals(2, et2.id);
  Expect.isNull(et2.name);

  ET2 et3 = ET2(3, "three");
  Expect.equals(3, et3.id);
  Expect.equals("three", et3.name);

  ET2 et4 = ET2.fromId(4);
  Expect.equals(5, et4.id);
  Expect.isNull(et4.name);
}

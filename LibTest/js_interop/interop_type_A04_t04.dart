// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that any non-external member of JS interop type can be
/// torn-off.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);
  external ET.fromId(int id);

  external int id;
  external String? get name;

  ET.notExternal(int id) : this.fromId(id);
  int getId() => id;
  static int answer() => 42;
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);
  external factory ET2.fromId(int id);

  external int get id;
  external String? get name;

  factory ET2.notExternal(int id) = ET2.fromId;
  int getId() => id;
  static int answer() => 42;
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
  var c1 = ET.notExternal;
  ET et = c1(1);
  Expect.equals(1, et.id);
  Expect.isNull(et.name);

  var to1 = et.getId;
  Expect.equals(1, to1());

  var to2 = ET.answer;
  Expect.equals(42, to2());

  var c2 = ET2.notExternal;
  ET2 et2 = c2(2);
  Expect.equals(2, et2.id);
  Expect.isNull(et2.name);

  var to3 = et2.getId;
  Expect.equals(2, to3());

  var to4 = ET2.answer;
  Expect.equals(42, to4());
}

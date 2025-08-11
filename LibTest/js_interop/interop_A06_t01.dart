// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can also write external members in extensions of interop
/// types.
///
/// @description Check that external members in extensions of interop types are
/// allowed and work as expected.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int get id;
}

extension on ET {
  external String? get name;
  external void set name(String? value);
  external int answer();
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);

  external int get id;
}

extension Ext on ET2 {
  @JS("name")
  external String? get getName;
  @JS("name")
  external void set setName(String? value);
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
      set name(v) {
        return this._name = v;
      }
      answer() {
        return 42;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et1 = ET(1, "one");
  Expect.equals(1, et1.id);
  Expect.equals("one", et1.name);
  et1.name = "1";
  Expect.equals("1", et1.name);
  Expect.equals(42, et1.answer());

  ET2 et2 = ET2(2, "two");
  Expect.equals(2, et2.id);
  Expect.equals("two", et2.getName);
  et2.setName = "2";
  Expect.equals("2", et2.getName);
  Expect.equals(42, et2.getAnswer());
}

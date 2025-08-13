// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - Instance members. Like with other Dart types, instance members require an
///   instance to be used. These members get, set, or invoke properties on the
///   instance.
///
/// @description Check that instance members with private names are allowed in
/// JS interop.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  external int _variable;
  external int get _getter;
  external String _method(String _);
  external void set _setter(int value);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external ET2();
  external int _variable;
  external int get _getter;
  external String _method(String _);
  external void set _setter(int value);
}

main() {
  eval(r'''
    class ET {
      constructor() {
        this._variable = 0;
      }
      get _getter() {
        return this._variable;
      }
      _method(v) {
        return v;
      }
      set _setter(value) {
        this._variable = value;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et = ET();
  Expect.equals(0, et._variable);
  Expect.equals(0, et._getter);
  et._setter = 42;
  Expect.equals(42, et._getter);
  Expect.equals("x", et._method("x"));

  ET2 et2 = ET2();
  Expect.equals(0, et2._variable);
  Expect.equals(0, et2._getter);
  et2._setter = 42;
  Expect.equals(42, et2._getter);
  Expect.equals("y", et2._method("y"));
}

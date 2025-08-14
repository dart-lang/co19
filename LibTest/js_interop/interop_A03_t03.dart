// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - static members. Like constructors, static members use the name of the
///   extension type to generate the JS code.
///
/// @description Check that static members use the name of the extension type to
/// generate the JS code. Test private names of the static members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external static int _variable;
  external static int get _getter;
  external static String _method(String _);
  external static void set _setter(int value);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external static int _variable;
  external static int get _getter;
  external static String _method(String _);
  external static void set _setter(int value);
}

main() {
  eval(r'''
    class ET {
      static _variable = 42;
      static get _getter() {
        return ET._variable;
      }
      static _method(v) {
        return v;
      }
      static set _setter(value) {
        ET._variable = value;
      }
    }
    globalThis.ET = ET;
  ''');

  Expect.equals(42, ET._variable);
  Expect.equals("x", ET._method("x"));
  ET._setter = -1;
  Expect.equals(-1, ET._getter);

  Expect.equals(-1, ET2._variable);
  Expect.equals("y", ET2._method("y"));
  ET2._setter = 42;
  Expect.equals(42, ET2._getter);
}

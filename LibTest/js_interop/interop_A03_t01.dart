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
/// generate the JS code.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external static int variable;
  external static int get getter;
  external static String method();
  external static void set setter(int value);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external static int variable;
  external static int get getter;
  external static String method();
  external static void set setter(int value);
}

main() {
  eval(r'''
    class ET {
      static variable = 42;
      static get getter() {
        return ET.variable;
      }
      static method() {
        return "static method";
      }
      static set setter(value) {
        ET.variable = value;
      }
    }
    globalThis.ET = ET;
  ''');

  Expect.equals(42, ET.variable);
  Expect.equals("static method", ET.method());
  ET.setter = -1;
  Expect.equals(-1, ET.getter);

  Expect.equals(-1, ET2.variable);
  Expect.equals("static method", ET2.method());
  ET2.setter = 42;
  Expect.equals(42, ET2.getter);
}

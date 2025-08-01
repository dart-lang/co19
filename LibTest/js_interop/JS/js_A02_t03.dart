// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that an extension type with external static members can
/// be used for JS interop.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

extension type ET(JSObject _) implements JSObject {
  external static int var1;

  external static String var2;

  external static int get x;

  external static void set x(int v);

  external static int f1();

  external static int f2(int v);
}

main() {
  eval(r'''
    class ET {
      static var1 = 1;
      static var2 = "two";
      static _x = 0;
      
      static get x() {
        return ET._x;
      }
      
      static set x(v) {
        ET._x = v;
      }
      
      static f1() {
        return ET.var1;
      }
      
      static f2(v) {
        return v;
      }
    }
    globalThis.ET = ET;
  ''');
  Expect.equals(1, ET.var1);
  Expect.equals("two", ET.var2);
  Expect.equals(0, ET.x);
  Expect.equals(1, ET.f1());
  Expect.equals(2, ET.f2(2));
  ET.x = 3;
  Expect.equals(3, ET.x);
}

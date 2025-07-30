// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that JS interop extension type may have not-external
/// members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type ET1(JSObject _) implements JSObject {
  external int f1();
  String f2(int v) => "f2($v)";
  static String f3() => "f3";
}

extension type ET2(JSObject _) implements JSObject {
  external int g1();
  String g2(int v) => "g2($v)";
  static String g3() => "g3";
}

main() {
  eval(r'''
    class ET1 {
      f1() {
        return 1;
      }
      f2() {
        return "JS f2";
      }
      static f3() {
        return "JS f3";
      }
    }
    class ET2 {
      g1() {
        return 2;
      }
      g2() {
        return "JS g2";
      }
      static g3() {
        return "JS g3";
      }
    }
    globalThis.et1 = new ET1();
    globalThis.et2 = new ET2();
  ''');
  ET1 et1 = ET1(globalContext["et1"] as JSObject);
  ET2 et2 = ET2(globalContext["et2"] as JSObject);
  Expect.equals(1, et1.f1());
  Expect.equals("f2(2)", et1.f2(2));
  Expect.equals("f3", ET1.f3());
  Expect.equals(2, et2.g1());
  Expect.equals("g2(2)", et2.g2(2));
  Expect.equals("g3", ET2.g3());
}

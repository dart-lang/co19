// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
/// ...
/// Specifying name customizes the JavaScript name to use, which can be used in
/// the following scenarios:
/// - Adding a JavaScript prefix to all the external top-level declarations,
///   static members, and constructors of a library by parameterizing the
///   annotation on the library with `name`.
/// - Specifying the JavaScript class to use for external static members and
///   constructors of an interop extension type by parameterizing the annotation
///   on the interop extension type with `name`.
/// - Renaming external declarations by parameterizing the annotation on the
///   member with `name`.
///
/// @description Check that specifying `name` customizes the JavaScript `name`
/// to use. Test static members of an extension type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

extension type ET(JSObject _) implements JSObject {
  @JS("jsVar1")
  external static int var1;

  @JS("jsVar2")
  external static final String var2;

  @JS("jsX")
  external static int get x;

  @JS("jsX")
  external static void set x(int v);

  @JS("jsF1")
  external static int f1();

  @JS("jsF2")
  external static int f2(int v);
}

main() {
  eval(r'''
    class ET {
      static jsVar1 = 1;
      static jsVar2 = "two";
      static _x = 0;
      
      static get jsX() {
        return ET._x;
      }
      
      static set jsX(v) {
        ET._x = v;
      }
      
      static jsF1() {
        return ET.jsVar1;
      }
      
      static jsF2(v) {
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

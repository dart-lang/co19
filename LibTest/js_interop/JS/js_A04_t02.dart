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
/// @description Check that `@JS(null)` is equivalent `@JS()`.
/// @author sgrekhov22@gmail.com

@JS(null)
library;

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS(null)
external int f1();

@JS(null)
extension type ET1(JSObject _) implements JSObject {
  external String f2();
  external static String f3();
}

extension type ET2(JSObject _) implements JSObject {
  @JS(null)
  external String f4();

  @JS(null)
  external static String f5();
}

main() {
  eval(r'''
    globalThis.f1 = function() {return 1;};
    
    class ET1 {
      f2() {
        return "f2() from ET1";
      }
      static f3() {
        return "f3() from ET1";
      }
    }
    globalThis.ET1 = ET1;
    globalThis.et1 = new ET1();
    
    class ET2 {
      f4() {
        return "f4() from ET2";
      }
      static f5() {
        return "f5() from ET2";
      }
    }
    globalThis.ET2 = ET2;
    globalThis.et2 = new ET2();
      ''');
  Expect.equals(1, f1());

  ET1 et1 = ET1(globalContext["et1"] as JSObject);
  Expect.equals("f2() from ET1", et1.f2());
  Expect.equals("f3() from ET1", ET1.f3());

  ET2 et2 = ET2(globalContext["et2"] as JSObject);
  Expect.equals("f4() from ET2", et2.f4());
  Expect.equals("f5() from ET2", ET2.f5());
}

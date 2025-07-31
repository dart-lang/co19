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
/// to use. Test extension type declaration.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS("JSEt")
extension type ET(JSObject _) implements JSObject {
  external String foo();
  external static String bar();
}

main() {
  eval(r'''
    class JSEt {
      foo() {
        return "foo() from JSEt";
      }
      
      static bar() {
        return "bar() from JSEt";
      }
    }
    globalThis.JSEt = JSEt;
    globalThis.et = new JSEt();
  ''');

  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals("foo() from JSEt", et.foo());
  Expect.equals("bar() from JSEt", ET.bar());
}

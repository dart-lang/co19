// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that a library directive can be annotated with a `@JS()`
/// annotation. Test an extension type with rename.
/// @author sgrekhov22@gmail.com

@JS("lib1")
library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS("C")
extension type A(JSObject v) implements JSObject {
  @JS("foo")
  external String myFoo();
  @JS("bar")
  external static String myBar();
}

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

main() {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    (async () => { 
      globalThis.lib1 = 
        await import('/root_dart/tests/co19/src/LibTest/js_interop/module.js');
    })().then(function(v) {
      globalThis.c = new globalThis.C();
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    A c = A(globalContext["c"] as JSObject);
    Expect.equals("C.foo() from module.js", c.myFoo());
    Expect.equals("C.bar() from module.js", A.myBar());
    asyncEnd();
  });
}

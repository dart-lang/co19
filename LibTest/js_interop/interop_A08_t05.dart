// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can also write multiple namespaces delimited by a `.` for
/// libraries, top-level members, and interop types.
///
/// @description Check that multiple namespaces delimited by a `.` can be
/// applied to libraries, top-level members, and interop types.
/// @author sgrekhov22@gmail.com

@JS("lib1.lib2")
library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@JS("lib3.answer")
external int foo();

@JS("lib3.C")
extension type ET._(JSObject _) implements JSObject {
  external ET();
  external String foo();
  @JS("bar")
  external static String baz();
}

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

main() {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    globalThis.lib1 = {lib2: {lib3: null}};
    (async () => { 
      globalThis.lib1.lib2.lib3 = 
        await import('/root_dart/tests/co19/src/LibTest/js_interop/module.js');
    })().then(function(v) {
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Expect.equals(42, foo()); // calls lib1.lib2.lib3.answer()
    Expect.equals("C.foo() from module.js", ET().foo());
    Expect.equals("C.bar() from module.js", ET.baz());
    asyncEnd();
  });
}

// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that a library directive can be annotated with a `@JS()`
/// annotation.
/// @author sgrekhov22@gmail.com

@JS("lib1")
library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external int answer();

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

main() {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    var lib1;
    (async () => { 
      lib1 = await import('/root_dart/tests/co19/src/LibTest/js_interop/module.js');
    })().then(function(v) {
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Expect.equals(42, answer()); // calls lib1.answer()
    asyncEnd();
  });
}

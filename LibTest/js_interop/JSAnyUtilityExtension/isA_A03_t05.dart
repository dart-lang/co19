// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// If T is a non-primitive JS type like [JSArray] or an interop extension type
/// on one, this uses an instanceof check using the name or the `@JS` rename of
/// the given type like `instanceOfString('Array')`. Note that if you rename the
/// library using the `@JS` annotation, this uses the rename in the instanceof
/// check like `instanceOfString('library1.JSClass')`.
///
/// @description Checks that `isA<>` returns `true` for an appropriate interop
/// type from a library.
/// @author sgrekhov22@gmail.com

@JS("lib1")
library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

@JS("A")
extension type ET1(JSObject o) implements JSObject {
  external int id;
  external String name;
}

main() {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    (async () => { 
      // This is path to the module on tryjobs. May not work locally.
      globalThis.lib1 = await import('/root_dart/tests/co19/src/LibTest/js_interop/module.js');
      globalThis.objA = new lib1.A(42, "A form JS");
    })().then(function(v) {
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    ET1 et1 = globalContext["objA"] as ET1;
    Expect.isTrue(et1.isA<ET1>()); // ET1 interops with lib1.A
    asyncEnd();
  });
}

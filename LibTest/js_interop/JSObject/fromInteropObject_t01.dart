// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSObject.fromInteropObject( Object interopObject )
///
/// Creates a [JSObject] from an object provided by an earlier interop library.
/// Accepts, for example, the types created using package:js or dart:html.
/// This constructor is intended to allow users to avoid having to cast to and
/// from `JSObject`.
///
/// @description Checks that this constructor creates a [JSObject] from an another
/// [JSObject].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.o1 = {id: "I'm JS object"};
  ''');
  Object o1 = globalContext["o1"] as Object;
  JSObject o2 = JSObject.fromInteropObject(o1);
  Expect.equals("I'm JS object", (o2.dartify() as Map)["id"]);
}

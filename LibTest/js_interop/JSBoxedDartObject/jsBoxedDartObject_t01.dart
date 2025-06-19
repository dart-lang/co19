// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A Dart object that is wrapped with a JavaScript object so that it
/// can be passed to JavaScript safely.
///
/// Unlike [ExternalDartReference], this can be used as a JS type and is a
/// subtype of [JSAny]. Users can also declare interop types using this as the
/// representation type or declare interop members on this type.
///
/// Use this interface when you want to pass Dart objects within the same
/// runtime through JavaScript. There are no usable members in the resulting
/// [JSBoxedDartObject].
///
/// @description Check that native Dart object can be passed to JS and received
/// back.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

class C {
  int id;
  String name;
  C(this.id, this.name);
}

main() {
  C c = C(42, "Object from Dart");
  JSBoxedDartObject boxed = c.toJSBox;
  globalContext["c"] = boxed;
  eval(r'''
    globalThis.jsC = c;
  ''');
  JSBoxedDartObject jsC = globalContext["jsC"] as JSBoxedDartObject;
  C fromJS = jsC.toDart as C;
  Expect.equals(c.id, fromJS.id);
  Expect.equals(c.name, fromJS.name);
  Expect.identical(c, fromJS);
}

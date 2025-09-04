// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object get toDart
/// The Dart [Object] that this [JSBoxedDartObject] wrapped.
///
/// Throws an [Exception] if the Dart runtime was not the same as the one in
/// which the [Object] was wrapped or if this was not a wrapped Dart [Object].
///
/// @description Check that this property returns the Dart [Object] that this
/// [JSBoxedDartObject] wrapped.
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
  C unboxed = boxed.toDart as C;
  Expect.equals(c.id, unboxed.id);
  Expect.equals(c.name, unboxed.name);
  Expect.identical(c, unboxed);
}

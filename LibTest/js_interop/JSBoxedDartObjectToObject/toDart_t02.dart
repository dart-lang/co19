// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object get toDart
/// The Dart [Object] that this [JSBoxedDartObject] wrapped.
///
/// Throws an [Exception] if the Dart runtime was not the same as the one in
/// which the [Object] was wrapped or if this was not a wrapped Dart [Object].
///
/// @description Check that an [Exception] is thrown if `toDart` was called not
/// on a wrapped Dart [Object].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSBoxedDartObject o = JSObject() as JSBoxedDartObject;
  Expect.throws(() {
    o.toDart;
  });
}

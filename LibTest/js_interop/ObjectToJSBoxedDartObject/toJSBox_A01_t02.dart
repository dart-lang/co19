// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript object that wraps this [Object].
///
/// There are no usable members in the resulting [JSBoxedDartObject] and you may
/// get a new [JSBoxedDartObject] when calling [toJSBox] on the same Dart
/// [Object].
///
/// Throws an [Exception] if this [Object] is a JavaScript value.
///
/// Unlike [ObjectToExternalDartReference.toExternalReference], this returns a
/// JavaScript value. Therefore, the representation is guaranteed to be
/// consistent across all platforms and interop members can be declared on
/// [JSBoxedDartObjects].
///
/// @description Checks that this property returns a JavaScript object that
/// wraps this [Object]. Test Dart [List].
/// @author sgrekhov22@gmail.com
/// @issue 61405, 56905

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  var boxedList = [42].toJSBox;
  Expect.listEquals([42], boxedList.toDart);
}

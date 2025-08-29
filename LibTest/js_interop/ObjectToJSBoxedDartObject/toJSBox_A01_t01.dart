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
/// wraps this [Object] and the original Dart object can be unwrapped via
/// `.toDart`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

class C {
  int id;
  C(this.id);
}

main() async {
  var boxedString = "String".toJSBox;
  Expect.equals("String", boxedString.toDart);

  var boxedNum = 42.toJSBox;
  Expect.equals(42, boxedNum.toDart);

  var boxedBool = false.toJSBox;
  Expect.isFalse(boxedBool.toDart);

  var boxedObject = C(42).toJSBox;
  Expect.equals(42, (boxedObject.toDart as C).id);

  var boxedMap = {"key": "value"}.toJSBox;
  Expect.mapEquals({"key": "value"}, boxedMap.toDart);

  var boxedSet = {42}.toJSBox;
  Expect.setEquals({42}, boxedSet.toDart as Set);

  var boxedFuture = Future.value(42).toJSBox;
  Expect.equals(42, await (boxedFuture.toDart as Future));
}

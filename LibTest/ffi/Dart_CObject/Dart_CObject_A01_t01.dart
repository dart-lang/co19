// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Dart_CObject()
///
/// @description Checks that Dart_CObject can be created
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  var o = new Dart_CObject();
  Expect.isTrue(o is Dart_CObject);
  Expect.isTrue(o is Opaque);
  Expect.runtimeIsType<Dart_CObject>(o);
  Expect.runtimeIsType<Opaque>(o);
}

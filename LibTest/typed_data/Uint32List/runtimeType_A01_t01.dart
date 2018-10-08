/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type runtimeType
 * A representation of the runtime type of the object.
 * @description Checks that the correct [Type] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Uint32List(0);
  var type = obj.runtimeType;
  Expect.isTrue(type is Type);
  Expect.stringEquals("Uint32List", obj.runtimeType.toString());
}

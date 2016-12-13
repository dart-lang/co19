/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type runtimeType
 * A representation of the runtime type of the object.
 * @description Checks that this property returns representation of the runtime
 * type of the object
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Object o = new Object();
  Expect.equals("Object", o.runtimeType.toString());
}

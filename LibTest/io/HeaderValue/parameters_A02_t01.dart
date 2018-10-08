/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> parameters
 * Gets the map of parameters.
 *
 * This map cannot be modified. Invoking any operation which would modify the
 * map will throw UnsupportedError.
 * @description Checks that this map cannot be modified
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HeaderValue hv = new HeaderValue("value", {"p1": "v1", "p2": "v2"});
  Expect.throws(() {hv.parameters["a"] = "b";}, (e) => e is UnsupportedError);
}

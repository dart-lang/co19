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
 * @description Checks that this property returns map of parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HeaderValue hv = new HeaderValue("value", {"p1": "v1", "p2": "v2"});
  Expect.mapEquals({"p1": "v1", "p2": "v2"}, hv.parameters);

  hv = new HeaderValue();
  Expect.mapEquals({}, hv.parameters);
}

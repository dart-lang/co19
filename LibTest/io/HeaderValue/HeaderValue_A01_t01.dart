/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HeaderValue([
 *  String value = "",
 *  Map<String, String> parameters
 *  ])
 * Creates a new header value object setting the value and parameters.
 * @description Checks that this constructor creates HeaderValue with correct
 * parameters and value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HeaderValue hv = new HeaderValue("value", {"p1": "v1", "p2": "v2"});
  Expect.equals("value", hv.value);
  Expect.mapEquals({"p1": "v1", "p2": "v2"}, hv.parameters);

  hv = new HeaderValue();
  Expect.equals("", hv.value);
  Expect.mapEquals({}, hv.parameters);
}

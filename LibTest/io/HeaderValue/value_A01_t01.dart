/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String value
 * Gets the header value.
 * @description Checks that this property gets the header value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HeaderValue hv = new HeaderValue();
  Expect.equals("", hv.value);

  hv = new HeaderValue("val");
  Expect.equals("val", hv.value);

}

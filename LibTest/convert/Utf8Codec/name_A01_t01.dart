/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * @description Checks that this property returns "utf-8"
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Codec codec = new Utf8Codec();
  Expect.equals("utf-8", codec.name);

  codec = new Utf8Codec(allowMalformed: true);
  Expect.equals("utf-8", codec.name);
}

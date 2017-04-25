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
 * @description Checks that UnsupportedError is thrown if parameters map is
 * modified
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"a": "b", "charset": "cp1251"});

  Expect.throws(() {contentType.parameters.addAll({"x": "y"});},
      (e) => e is UnsupportedError);
}

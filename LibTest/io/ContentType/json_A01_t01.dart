/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic JSON
 *  final
 *  Content type for JSON using UTF-8 encoding.
 * @description Checks that this constant returns content type for JSON using
 * UTF-8 encoding
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(ContentType.json);
  Expect.equals("application/json; charset=utf-8", ContentType.json.toString());
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic TEXT
 *  final
 *  Content type for plain text using UTF-8 encoding.
 * @description Checks that this constant returns content type for plain text
 * using UTF-8 encoding.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(ContentType.text);
  Expect.equals("text/plain; charset=utf-8", ContentType.text.toString());
}

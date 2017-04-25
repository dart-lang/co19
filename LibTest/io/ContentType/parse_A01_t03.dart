/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ContentType parse(String value)
 * Creates a new content type object from parsing a Content-Type header value.
 * As primary type, sub type and parameter names and values are not case
 * sensitive all these values will be converted to lower case. Parsing this
 * string
 *         text/html; charset=utf-8
 * will create a content type object with primary type text, sub type html and
 * parameter charset with value utf-8.
 * @description Checks that this method returns a new content type object from
 * parsing a Content-Type header value. Test parse an empty string
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String source = "";
  ContentType contentType = ContentType.parse(source);
  Expect.isNotNull(contentType);
  Expect.isNull(contentType.charset);
  Expect.equals("/", contentType.mimeType);
  Expect.equals("", contentType.primaryType);
  Expect.equals("", contentType.subType);
  Expect.mapEquals({}, contentType.parameters);
}

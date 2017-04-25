/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ContentType(
 *  String primaryType,
 *  String subType, {
 *  String charset,
 *  Map<String, String> parameters
 *  })
 * Creates a new content type object setting the primary type and sub type. The
 * charset and additional parameters can also be set using charset and
 * parameters. If charset is passed and parameters contains charset as well the
 * passed charset will override the value in parameters. Keys passed in
 * parameters will be converted to lower case. The charset entry, whether
 * passed as charset or in parameters, will have its value converted to
 * lower-case.
 * @description Checks that this constructor creates a new content type object
 * from parsing a Content-Type header value. Test only required parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(String primaryType, String subType) {
  ContentType contentType = new ContentType(primaryType, subType);
  Expect.isNull(contentType.charset);
  Expect.equals(primaryType + "/" + subType, contentType.mimeType);
  Expect.equals(primaryType, contentType.primaryType);
  Expect.equals(subType, contentType.subType);
  Expect.mapEquals({}, contentType.parameters);
}

main() {

  check("text", "html");
  check("ptype", "stype");
  check("ptype", "");
  check("", "stype");
  check("", "");
}

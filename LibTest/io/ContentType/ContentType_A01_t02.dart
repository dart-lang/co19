// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ContentType(
///  String primaryType,
///  String subType, {
///  String charset,
///  Map<String, String> parameters
///  })
/// Creates a new content type object setting the primary type and sub type. The
/// charset and additional parameters can also be set using charset and
/// parameters. If charset is passed and parameters contains charset as well the
/// passed charset will override the value in parameters. Keys passed in
/// parameters will be converted to lower case. The charset entry, whether
/// passed as charset or in parameters, will have its value converted to
/// lower-case.
/// @description Checks that this constructor creates a new content type object
/// from parsing a Content-Type header value. Test optional parameters
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"p1" : "v1", "p2": "v2"});
  Expect.equals("text/html", contentType.mimeType);
  Expect.equals("text", contentType.primaryType);
  Expect.equals("html", contentType.subType);
  Expect.equals("utf-8", contentType.charset);
  Expect.mapEquals({"p1" : "v1", "p2": "v2", "charset": "utf-8"},
      contentType.parameters);
}

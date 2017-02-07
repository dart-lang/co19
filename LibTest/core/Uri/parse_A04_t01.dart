/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 *
 * If start and end are provided, only the substring from start to end is parsed
 * as a URI.
 *
 * If the string is not valid as a URI or URI reference, a FormatException is
 * thrown.
 * @description Checks that if start and end are provided, only the substring
 * from start to end is parsed as a URI
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = "http://host.com:123/path/path?d=dart#uri";
  Expect.equals(Uri.parse(uri),
      Uri.parse("abc" + uri + "xxx", 3, 3 + uri.length));

  Expect.equals(Uri.parse(uri),
      Uri.parse("abc" + uri, 3));
}

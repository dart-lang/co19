/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 * @description Checks that this method works for data schemas
 * @issue 28700
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Uri uri = Uri.parse("data:text/plain,some data");
  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("text/plain,some%20data", uri.path);
  Expect.equals("", uri.query);
  Expect.equals("", uri.fragment);
}

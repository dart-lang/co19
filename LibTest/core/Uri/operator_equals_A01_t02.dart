/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * An URI is equal to another URI with the same normalized representation.
 * @description Checks that an URI is not equal to another URI with not the same
 * normalized representation.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse('scheme://user:pass@host/path/');
  var url2 = Uri.parse('scheme://User:pass@host/path/');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('scheme://user:pass@host/path/');
  url2 = Uri.parse('scheme://user:Pass@host/path/');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('scheme://user:pass@host/path/');
  url2 = Uri.parse('scheme://user:pass@host/Path/');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('scheme://user:pass@host?q');
  url2 = Uri.parse('scheme://user:pass@host?Q');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('scheme://user:pass@host?q#f');
  url2 = Uri.parse('scheme://user:pass@host?q#F');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('http://host/path/');
  url2 = Uri.parse('http://host:8080/path/');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('https://host/path/');
  url2 = Uri.parse('https://host:444/path/');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('/path/');
  url2 = Uri.parse('/path');
  Expect.notEquals(url1, url2);

  url1 = Uri.parse('../path/');
  url2 = Uri.parse('./path/');
  Expect.notEquals(url1, url2);
}

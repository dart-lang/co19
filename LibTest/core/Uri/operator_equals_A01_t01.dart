/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * An URI is equal to another URI with the same normalized representation.
 * @description Checks that an URI is equal to another URI with the same
 * normalized representation.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse('scheme://user:pass@host/path/');
  var url2 = Uri.parse('SCHEME://user:pass@HOST/path/');
  Expect.equals(url1, url2);

  url1 = Uri.parse('../path/');
  url2 = Uri.parse('../path/');
  Expect.equals(url1, url2);

  url1 = Uri.parse('http://host/path/');
  url2 = Uri.parse('http://host:80/path/');
  Expect.equals(url1, url2);

  url1 = Uri.parse('https://host/path/');
  url2 = Uri.parse('https://host:443/path/');
  Expect.equals(url1, url2);

  url1 = new Uri(scheme: 'http', host: 'host', port: 8080, path: '/a/b',
      query: 'a=1', fragment: 'fr');
  url2 = new Uri(scheme: 'http', host: 'host', port: 8080, path: '/a/b',
      query: 'a=1', fragment: 'fr');
  Expect.equals(url1, url2);

  url1 = new Uri(scheme: 'http', host: 'host', port: 8080, path: '/a/b',
      query: 'a=1', fragment: 'fr');
  url2 = new Uri(scheme: 'Http', host: 'Host', port: 8080, path: '/a/b',
      query: 'a=1', fragment: 'fr');
  Expect.equals(url1, url2);
}

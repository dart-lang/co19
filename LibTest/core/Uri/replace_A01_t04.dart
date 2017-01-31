/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri replace({
 *  String scheme,
 *  String userInfo,
 *  String host,
 *  int port,
 *  String path,
 *  Iterable<String> pathSegments,
 *  String query,
 *  Map<String, dynamic> queryParameters,
 *  String fragment
 *  })
 * Returns a new Uri based on this one, but with some parts replaced.
 *
 * This method takes the same parameters as the new Uri constructor, and they
 * have the same meaning.
 * ...
 * Each part that is not provided will default to the corresponding value from
 * this Uri instead.
 * ...
 * @description Check that this method returns a new Uri based on this one, but
 * with some parts replaced. Test port
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse("http://user:pass@host/path/?q#fr");
  var url2 = Uri.parse("http://user:pass@host:8080/path/?q#fr");
  Expect.equals(url2, url1.replace(port: 8080));

  url1 = Uri.parse("scheme://user:pass@host:123/path/?q#fr");
  url2 = Uri.parse("scheme://user:pass@host:456/path/?q#fr");
  Expect.equals(url2, url1.replace(port: 456));

  url1 = Uri.parse("http://user:pass@host/path/?q#fr");
  url2 = Uri.parse("http://user:pass@host:443/path/?q#fr");
  Expect.equals(url2, url1.replace(port: 443));

  url1 = Uri.parse("https://user:pass@host/path/?q#fr");
  url2 = Uri.parse("https://user:pass@host:80/path/?q#fr");
  Expect.equals(url2, url1.replace(port: 80));
}

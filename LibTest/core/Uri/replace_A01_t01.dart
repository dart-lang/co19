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
 * with some parts replaced. Test scheme.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  var url2 = Uri.parse("replaced://user:pass@host/path/?q#fr");
  Expect.equals(url2, url1.replace(scheme: "replaced"));

  url1 = Uri.parse("http://user:pass@host/path/");
  url2 = Uri.parse("https://user:pass@host/path/");
  Expect.equals(url2, url1.replace(scheme: "https"));
  Expect.equals(443, url1.replace(scheme: "https").port);

  url1 = Uri.parse("https://user:pass@host/path/");
  url2 = Uri.parse("http://user:pass@host/path/");
  Expect.equals(url2, url1.replace(scheme: "http"));
  Expect.equals(80, url1.replace(scheme: "http").port);

  url1 = Uri.parse("https://host/path/");
  url2 = Uri.parse("//host/path/");
  Expect.equals(url2, url1.replace(scheme: ""));

  url1 = Uri.parse("https://user:pass@host/path/");
  url2 = Uri.parse("http://user:pass@host/path/");
  Expect.equals(url2, url1.replace(scheme: "HTTP"));
}

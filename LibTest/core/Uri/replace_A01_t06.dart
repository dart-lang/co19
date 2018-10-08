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
 * with some parts replaced. Test pathSegments
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse("http://host/a/b/c/?a=1#b");
  var url2 = Uri.parse("http://host/e/f/g/h?a=1#b");
  Expect.equals(url2, url1.replace(pathSegments: ["e", "f", "g", "h"]));

  url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  url2 = Uri.parse("scheme://user:pass@host/replaced?q#fr");
  Expect.equals(url2, url1.replace(pathSegments: ["replaced"]));

  url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  url2 = Uri.parse("scheme://user:pass@host/rePlaCed?q#fr");
  Expect.equals(url2, url1.replace(pathSegments: ["rePlaCed"]));

  url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  url2 = Uri.parse("scheme://user:pass@host/rep laced?q#fr");
  Expect.equals(url2, url1.replace(pathSegments: ["rep laced"]));

  url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  url2 = Uri.parse("scheme://user:pass@host?q#fr");
  Expect.equals(url2, url1.replace(pathSegments: []));
}

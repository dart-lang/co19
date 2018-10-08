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
 * ...
 * At most one of path and pathSegments must be provided. Likewise, at most one
 * of query and queryParameters must be provided.
 * @description Check that exception is thrown if both query and queryParameters
 * specified
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url = Uri.parse("scheme://user:pass@host/path/?q#fr");
  Expect.throws(() {
    url.replace(query: "replaced1", queryParameters: {"q": "replaced2"});
  });
  Expect.throws(() {
    url.replace(query: "replaced1", queryParameters: {});
  });
  Expect.throws(() {
    url.replace(query: "", queryParameters: {"q": ""});
  });
}

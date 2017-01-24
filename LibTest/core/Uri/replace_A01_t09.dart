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
 *
 * At most one of path and pathSegments must be provided. Likewise, at most one
 * of query and queryParameters must be provided.
 *
 * Each part that is not provided will default to the corresponding value from
 * this Uri instead.
 *
 * This method is different from Uri.resolve which overrides in a hierarchical
 * manner, and can instead replace each part of a Uri individually.
 * @description Check that this method returns a new Uri based on this one, but
 * with some parts replaced. Test fragment
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse("http://host/path/?a=1&b=2#fr");
  var url2 = Uri.parse("http://host/path/?a=1&b=2#replaced");
  Expect.equals(url2, url1.replace(fragment: "replaced"));

  url1 = Uri.parse("http://host/path/?a=1&b=2#fr");
  url2 = Uri.parse("http://host/path/?a=1&b=2#rePlaCed");
  Expect.equals(url2, url1.replace(fragment: "rePlaCed"));

  url1 = Uri.parse("http://host/path/?a=1&b=2#fr");
  url2 = Uri.parse("http://host/path/?a=1&b=2#rep%20laced");
  Expect.equals(url2, url1.replace(fragment: "rep laced"));

  url1 = Uri.parse("http://host/path/?a=1&b=2#fr");
  url2 = Uri.parse("http://host/path/?a=1&b=2#");
  Expect.equals(url2, url1.replace(fragment: ""));
}

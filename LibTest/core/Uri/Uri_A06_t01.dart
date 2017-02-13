/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Uri({scheme, String userInfo: "", String host: "", port: 0,
 * String path, Iterable<String> pathSegments, String query, Map<String,
 * String> queryParameters, fragment: ""})
 * Creates a new URI from its components.
 * The query component is set through either query or
 * queryParameters. When query is used the provided string is expected to be
 * fully percent-encoded and is used in its literal form. When queryParameters
 * is used the query is built from the provided map. Each key and value in the
 * map is percent-encoded and joined using equal and ampersand characters.
 * The percent-encoding of the keys and values encodes all characters except
 * for the unreserved characters.
 * @description Checks that query set via [query] is used in its literal form
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var q = '%01=%01&x=1';
  var x = new Uri(query: q);
  Expect.equals(q, x.query);
}

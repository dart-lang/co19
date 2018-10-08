/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.http(String authority, String unencodedPath,
 * [Map<String, String> queryParameters])
 * Creates a new http URI from authority, path and query.
 * The scheme is always set to http.
 * @description Checks correct scheme setting
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('http', new Uri.http('foo.bar', '\u0001').scheme);
  Expect.equals('http', new Uri.http('','').scheme);
}

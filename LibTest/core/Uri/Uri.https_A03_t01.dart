/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.https(String authority, String unencodedPath,
 * [Map<String, String> queryParameters])
 * Creates a new https URI from authority, path and query.
 * The path component is set from the unencodedPath argument. The path passed
 * must not be encoded as this constructor encodes the path.
 * @description Checks expected path settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri.https('', 'foo/bar');
  Expect.equals('foo/bar', x.path);
  
  x = new Uri.https('', '/foo/\u0000/\u0001');
  Expect.equals('/foo/%00/%01', x.path);

  x = new Uri.https('', '/foo/ й / ф /%/');
  Expect.equals('/foo/%20%D0%B9%20/%20%D1%84%20/%25/', x.path);

  x = new Uri.https('', r'/foo/\/');
  Expect.equals('/foo/%5C/', x.path);
}

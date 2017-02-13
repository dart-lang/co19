/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.https(String authority, String unencodedPath,
 * [Map<String, String> queryParameters])
 * Creates a new https URI from authority, path and query.
 * The query component is set from the optional queryParameters argument.
 * @description Checks expected query settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri.https('', '', {});
  Expect.equals('', x.query);
  
  x = new Uri.https('', '', {'foo': 'bar', 'bar': null});
  Expect.equals('foo=bar&bar', x.query);
  
  x = new Uri.https('', '', {' \u0000': ' \u0000', ' \u0001': ' \u0001'});
  Expect.equals('+%00=+%00&+%01=+%01', x.query);

  x = new Uri.https('', '', {' й ': ' ф '});
  Expect.equals('+%D0%B9+=+%D1%84+', x.query);
}

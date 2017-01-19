/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String query
 * Returns the query component. The returned query is encoded. To get direct
 * access to the decoded query use queryParameters.
 * Returns the empty string if there is no query component.
 * @description Checks expected query settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = 'x&%00=%01';
  Expect.equals(x,
      new Uri(queryParameters: {'x': null, '\u0000': '\u0001'}).query);
  Expect.equals(x, Uri.parse('../path?$x').query);

  x = 'a=b&c=%D1%84';
  Expect.equals(x,
      new Uri(queryParameters: {'a': 'b', 'c': 'ф'}).query);
  Expect.equals(x, Uri.parse('../path?$x').query);
}


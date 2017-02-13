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
 * Each component is set through a named argument. Any number of components
 * can be provided. The default value for the components not
 * provided is the empty string, except for port which has a default value
 * of 0. 
 * @description Check some cases with not provided components
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri(scheme: 'foo', userInfo: 'root', host: 'bar', path: '/a/b',
      query: 'x=1');
  Expect.equals(0, x.port);
  Expect.equals('', x.fragment);

  x = new Uri(scheme: 'foo', host: 'bar', path: '/a/b');
  Expect.equals('', x.userInfo);
  Expect.equals(0, x.port);
  Expect.equals('', x.query);
  Expect.equals('', x.fragment);
}

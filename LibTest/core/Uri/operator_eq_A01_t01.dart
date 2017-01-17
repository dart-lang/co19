/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * @description Checks differently constructed URIs for equality
 * equal URIs
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri(scheme: 'http', host: 'foo', path: 'a/b', port: 123,
      queryParameters: {'a': '1', 'b': '2'});
  var y = new Uri.http('foo:123', 'a/b', {'a': '1', 'b': '2'});
  Expect.equals(x, y);

  Expect.notEquals(Uri.parse('foo://bar'), Uri.parse('foo://bar/'));
}

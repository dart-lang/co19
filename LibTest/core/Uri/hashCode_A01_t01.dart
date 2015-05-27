/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int hashCode
 * Get a hash code for this object.
 * @description Checks that hash codes are equal for differently constructed
 * equal URIs
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  var x = new Uri(scheme: 'http', host: 'foo', path: 'a/b', port:123,
      queryParameters: {'a':'1', 'b':'2'});
  var y = new Uri.http('foo:123', 'a/b', {'a':'1', 'b':'2'});
  Expect.equals(x.hashCode, y.hashCode);
}


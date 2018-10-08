/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<String> pathSegments
 * Returns the URI path split into its segments.
 * The returned list is unmodifiable and will throw UnsupportedError on any
 * calls that would mutate it.
 * @description Checks that UnsupportedError is thrown on pathSegments
 * modification attempt
 * returned
 * @author ilya
 */

import "../../../Utils/expect.dart";

main() {
  Expect.throws(() { 
    Uri.parse('http://host/path').pathSegments[0] = 'foo';
  }, (e) => e is UnsupportedError);
}

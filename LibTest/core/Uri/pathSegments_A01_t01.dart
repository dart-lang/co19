/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<String> pathSegments
 * Returns the URI path split into its segments.
 * Each of the segments in the returned list have been decoded. If the path
 * is empty the empty list will be returned. A leading slash / does not
 * affect the segments returned.
 * @description Checks that segments are decoded
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = new Uri(path: '%C2%AA/%C2%AA');
  Expect.listEquals(['\u00AA', '\u00AA'], x.pathSegments);

  x = new Uri(path: 'some path1/another path2');
  Expect.listEquals(['some path1', 'another path2'], x.pathSegments);

  x = new Uri(path: '/some path1/another path2');
  Expect.listEquals(['some path1', 'another path2'], x.pathSegments);

  x = new Uri(path: '/a/b/c/d/');
  Expect.listEquals(['a', 'b', 'c', 'd', ''], x.pathSegments);
}

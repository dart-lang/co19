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
 * The path component is set through either path or pathSegments.
 * When path is used, the provided string is expected to be fully
 * percent-encoded, and is used in its literal form. When pathSegments is used,
 * each of the provided segments is percent-encoded and joined using the
 * forward slash separator. The percent-encoding of the path segments encodes
 * all characters except for the unreserved characters and the following list
 * of characters: !$&'()*+,;=:@. If the other components calls for an absolute
 * path a leading slash / is prepended if not already there.
 * @description Checks that path set via [pathSegments] is correctly encoded
 * @author ilya
 */
import "../../../Utils/expect.dart";

var notEncoded = "0123456789"
                 "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                 "abcdefghijklmnopqrstuvwxyz"
                 "-._~"
                 r"!$&'()*+,;=:@";

main() {
  var x = new Uri(pathSegments: ['\uA000\u{10000}', 'b']);
  Expect.equals('${Uri.encodeComponent("\uA000\u{10000}")}/b', x.path);

  x = new Uri(pathSegments: [notEncoded, 'b']);
  Expect.equals('$notEncoded/b', x.path);
}

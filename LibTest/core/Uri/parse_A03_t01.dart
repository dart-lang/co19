/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 *
 * If start and end are provided, only the substring from start to end is parsed
 * as a URI.
 *
 * If the string is not valid as a URI or URI reference, a FormatException is
 * thrown.
 * @description RFC-3986 The reg-name syntax allows percent-encoded octets in
 * order to represent non-ASCII registered names.
 * Checks that percent-encoded hostname is accepted.
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var host = '%D0%B9%D1%86%D1%83%D0%BA%D0%B5%D0%BD.%D1%80%D1%84';
  Expect.equals(host, Uri.parse('http://$host').host);
}

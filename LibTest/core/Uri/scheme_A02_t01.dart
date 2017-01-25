/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String scheme
 * ...
 * A URI scheme is case insensitive. The returned scheme is canonicalized to
 * lowercase letters.
 * @description Checks that URI scheme is case insensitive
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('http', Uri.parse('HTTP://host/path').scheme);
  Expect.equals('https', Uri.parse('HTTPS://host/path').scheme);
  Expect.equals('https', Uri.parse('hTTPs://host/path').scheme);
  Expect.equals('scheme', Uri.parse('SchemE://host/path').scheme);
}

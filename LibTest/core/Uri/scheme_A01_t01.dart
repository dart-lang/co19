/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String scheme
 * Returns the scheme component.
 * Returns the empty string if there is no scheme component.
 * @description Checks empty and non empty scheme settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('https', new Uri.https('host', 'path').scheme);
  Expect.equals('http', Uri.parse('http://host/path').scheme);

  Expect.equals('', Uri.parse('../path').scheme);
  Expect.equals('', Uri.parse('www.host/path').scheme);
}

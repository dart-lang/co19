/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Returns the path component.
 * The returned path is encoded. To get direct access to the decoded path use
 * pathSegments.
 * Returns the empty string if there is no path component.
 * @description Checks empty path settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('', Uri.parse('http://').path);
  Expect.equals('', new Uri(host: 'host').path);
}

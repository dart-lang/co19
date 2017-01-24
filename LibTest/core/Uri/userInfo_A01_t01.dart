/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String userInfo
 * Returns the user info part of the authority component.
 * Returns the empty string if there is no user info in the authority
 * component.
 * @description Checks empty and non empty userInfo settings
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('user:pass', Uri.parse('asdf://user:pass@host').userInfo);
  Expect.equals('', Uri.parse('/a/b').userInfo);
}

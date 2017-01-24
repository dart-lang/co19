/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String userInfo
 * Returns the user info part of the authority component.
 * Returns the empty string if there is no user info in the authority
 * component.
 * @description Checks that this method returns the user info part of the
 * authority component
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('User', Uri.parse('http://User@host').userInfo);
  Expect.equals('user:PASS', Uri.parse('https://user:PASS@host').userInfo);
  Expect.equals(':PASs', Uri.parse('https://:PASs@host').userInfo);
  Expect.equals(':', Uri.parse('https://:@host').userInfo);
}

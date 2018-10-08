/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri uri
 * Returns a Uri representing the directory's location.
 *
 * The returned URI's scheme is always "file" if the entity's path is absolute,
 * otherwise the scheme will be empty. The returned URI's path always ends in a
 * slash ('/').
 * @description Checks that this property returns a Uri representing the
 * directory's location. Test relative path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Directory dir = new Directory("NotExisting");
  Expect.equals("NotExisting/", dir.uri.path);
  Expect.equals("", dir.uri.scheme);
}

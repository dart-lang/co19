/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link(String path)
 * Creates a Link object.
 * @description Checks that this constructor creates a Link object. Test
 * relative path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Link link = new Link("");
  Expect.equals(Directory.current.path + Platform.pathSeparator,
      link.absolute.path);
}

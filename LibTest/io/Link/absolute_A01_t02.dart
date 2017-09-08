/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link absolute
 * Returns a Link instance whose path is the absolute path to this.
 * The absolute path is computed by prefixing a relative path with the current
 * working directory, and returning an absolute path unchanged.
 * @description Checks that this property returns a Link instance whose
 * path is the absolute path to this. Test parent property
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Link link = new Link("TestDir" + Platform.pathSeparator + "tmp.dart");
  Expect.equals(Directory.current.path + Platform.pathSeparator + "TestDir",
      link.absolute.parent.path);
}

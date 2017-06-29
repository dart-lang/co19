/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Get the path of the file.
 * @description Checks that this property returns the path of this file.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  File file = new File("TestDir" + Platform.pathSeparator + "tmp.dart");
  Expect.equals("TestDir" + Platform.pathSeparator + "tmp.dart", file.path);

  file = new File("NotExist");
  Expect.equals("NotExist", file.path);

  file = new File(
      Directory.current.path + Platform.pathSeparator + "TestDir" +
          Platform.pathSeparator + "tmp.dart");
  Expect.equals(
      Directory.current.path + Platform.pathSeparator + "TestDir" +
          Platform.pathSeparator + "tmp.dart", file.path);
}

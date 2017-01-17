/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Returns the path component.
 * The returned path is encoded. To get direct access to the decoded path use
 * pathSegments.
 * Returns the empty string if there is no path component.
 * @description Checks that the returned path is encoded
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("some%20path", new Uri(path: "some path").path);
  Expect.equals("/some%20path/index%20page.dart",
      Uri.parse("http://host/some path/index page.dart").path);
  Expect.equals("%D0%BF%D1%83%D1%82%D1%8C", new Uri(path: "путь").path);
  Expect.equals("/%D0%BF%D1%83%D1%82%D1%8C/%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0.dart",
      Uri.parse("http://хост/путь/страница.dart").path);
}

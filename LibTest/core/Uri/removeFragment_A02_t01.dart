/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri removeFragment()
 * ...
 * If this Uri does not have a fragment, it is itself returned.
 * @description Check that if this Uri does not have a fragment, it is itself
 * returned.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url = Uri.parse("scheme://user:pass@host/path/?q");
  Expect.equals(url, url.removeFragment());

  url = Uri.parse("/path/?q");
  Expect.equals(url, url.removeFragment());

  url = Uri.parse("../path/a/?q");
  Expect.equals(url, url.removeFragment());

  url = new Uri(path: "/p/");
  Expect.equals(url, url.removeFragment());
}

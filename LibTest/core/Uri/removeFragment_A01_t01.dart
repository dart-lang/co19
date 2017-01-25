/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri removeFragment()
 * Returns a Uri that differs from this only in not having a fragment.
 * ...
 * @description Check that this method returns a Uri that differs from this only
 * in not having a fragment.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url1 = Uri.parse("scheme://user:pass@host/path/?q#fr");
  var url2 = Uri.parse("scheme://user:pass@host/path/?q");
  Expect.equals(url2, url1.removeFragment());

  url1 = Uri.parse("/path/?q#fr");
  url2 = Uri.parse("/path/?q");
  Expect.equals(url2, url1.removeFragment());

  url1 = Uri.parse("../path/a/?q#fr");
  url2 = Uri.parse("../path/a/?q");
  Expect.equals(url2, url1.removeFragment());

  url1 = new Uri(path: "/p/", fragment: "f");
  url2 = new Uri(path: "/p/");
  Expect.equals(url2, url1.removeFragment());
}

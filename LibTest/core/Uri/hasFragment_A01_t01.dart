/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasFragment
 * Returns whether the URI has a fragment part.
 * @description Checks that this property returns true if the URI has a fragment
 * part
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasFragment);
  
  uri = new Uri(port: 123);
  Expect.isFalse(uri.hasFragment);
  
  uri = new Uri(fragment: "mark");
  Expect.isTrue(uri.hasFragment);

  uri = Uri.parse("https://www.dartlang.org/");
  Expect.isFalse(uri.hasFragment);

  uri = Uri.parse("https://www.dartlang.org/guides/language/sound-faq#is-typing-optional");
  Expect.isTrue(uri.hasFragment);

  uri = Uri.parse("foo:/");
  Expect.isFalse(uri.hasFragment);

  uri = Uri.parse("/a/b/c/index.dart#mark");
  Expect.isTrue(uri.hasFragment);

  uri = Uri.parse("a/b/c/index.dart#mark");
  Expect.isTrue(uri.hasFragment);
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool find(String string, bool caseSensitive, bool backwards,
 *        bool wrap, bool wholeWord, bool searchInFrames, bool showDialog)
 * Finds text in this window.
 * from MDN:
 * aString:  The text string for which to search.
 * @description Checks that subsequent search with the same parameters works.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var text = 'text';
  document.body.append(new Text(text));
  bool res1 = window.find(text, false, false, false, false, false, false);
  bool res2 = window.find(text, false, false, false, false, false, false);
  print("res1=$res1 res2=$res2");
  Expect.isTrue(res1, "text not found");
  Expect.isTrue(res2, "second time text not found");
}

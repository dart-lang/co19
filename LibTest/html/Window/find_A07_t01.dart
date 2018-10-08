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
 * aShowDialog: Boolean. If true, specifies a show Dialog.
 * @description Checks that wholeWord parameter works.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var text = 'textext';
  var text2find = 'text';
  document.body.append(new Text(text));
  bool res = window.find(text2find, false, false, false, false, false, false);
//  res=window.find(text2find, false, false, true, false, false, false);
  Expect.isTrue(res, "text2find not found");

  res = window.find(text2find, false, false, false, false, false, false);
  Expect.isFalse(res, "text2find found");
}

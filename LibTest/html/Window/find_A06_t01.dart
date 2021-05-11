// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool find(String string, bool caseSensitive, bool backwards,
///        bool wrap, bool wholeWord, bool searchInFrames, bool showDialog)
/// Finds text in this window.
/// from MDN:
/// aString:  The text string for which to search.
/// aSearchInFrames: Boolean. If true, specifies a search in frames.
/// @description Checks that searchInFrames parameter works.
/// @issue 43351

// OtherResources=iframe.html
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var text = 'Content';
  var x = Element.html(
      '<iframe src="iframe.html"></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  document.body?.append(x);

  bool res = window.find(text, false, false, false, false, true, false);
  Expect.isTrue(res, "text not found");

  res = window.find(text, false, false, false, false, false, false);
  Expect.isFalse(res, "text found");
}

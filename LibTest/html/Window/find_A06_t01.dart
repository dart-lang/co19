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
 * aSearchInFrames: Boolean. If true, specifies a search in frames.
 * @description Checks that searchInFrames parameter works.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var text = 'textext';
  IFrameElement frame = new IFrameElement();
  document.body.append(frame);
//  frame.contentWindow.document.body.append(new Text(text));
//  frame.appendHtml("<div>$text</div>");
//  frame.setInnerHtml("<html><head></head><body><div>$text</div></body></html>");
  frame.appendHtml("<html><head></head><body><div>$text</div></body></html>",
      treeSanitizer: NodeTreeSanitizer.trusted);
  var child = frame;
  for (int k = 1; k < 5; k++) {
    var nodes = child.nodes;
    print("$k $child nodes.length=${nodes.length}");
    for (int n = 1; n < nodes.length; n++) {
      var node = nodes[n];
      print("  node $n = $node");
    }
    child = child.firstChild;
    if (child == null) break;
  }

  bool res = window.find(text, false, false, false, false, false, false);
  Expect.isFalse(res, "text not found");

  res = window.find(text, false, false, false, true, false, false);
  Expect.isTrue(res, "text found");
}

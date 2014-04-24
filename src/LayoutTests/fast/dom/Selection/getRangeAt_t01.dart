/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test to make sure that getRangeAt does not modify the range 
 * when returning it.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  _shouldThrow(func()) =>
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.INVALID_STATE);

  var div = document.createElement('div');
  document.body.append(div);
  var textNode = new Text("asd");
  div.append(textNode);

  var sel = window.getSelection();
  sel.collapse(textNode, 0);
  var range = sel.getRangeAt(0);

  var result = range.comparePoint(textNode, 0);
  if (result == 0) {
    testPassed("range is correctly (text, 0)");
  } else {
    var report = '''
      window.getSelection():
      anchorNode: ${sel.anchorNode}
      anchorOffset: ${sel.anchorOffset} 
      focusNode: ${sel.focusNode} 
      focusOffset: ${sel.focusOffset}

      window.getSelection().getRangeAt(0):
      startContainer: ${range.startContainer}
      startOffset: ${range.startOffset}
      endContainer: ${range.endContainer}
      endOffset: ${range.endOffset}''';
    testFailed("range did not match (text, 0):" + report);
  }

  // Clean up after ourselves
  div.remove();
}

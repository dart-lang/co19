/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test some cases of Range.deleteContents() behavior (namely, 
 * examples from DOM Range spec).
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
<pre id="console"></pre>

<div style="visibility:hidden">
<FOO>AB<MOO>CD</MOO>CD</FOO>
<FOO>A<MOO>BC</MOO>DE</FOO>
<FOO>XY<BAR>ZW</BAR>Q</FOO>
<FOO><BAR1>AB</BAR1><BAR2></BAR2><BAR3>CD</BAR3></FOO>
</div>''', treeSanitizer: new NullTreeSanitizer());

  log(message) {
    document.getElementById('console').append(new Text(message));
  }

  // Simple recursive "give me a string to represent this tree" function
  treeAsString(node) {
    var string = node.nodeName;
    if (string[0] != "#")
      string = "<" + string + ">";
    if (string == "#text")
      string = node.text;
    if (node.childNodes.length > 0) {
      string += " [";
    }
    for (var x = 0; x < node.childNodes.length; x++) {
      if (x != 0) {
        string += ", ";
      }
      string += treeAsString(node.childNodes[x]);
    }

    if (node.childNodes.length > 0) {
      string += "]";
    }
    return string;
  }

  var range = document.createRange();

  var foo = document.getElementsByTagName("FOO")[0];
  range.setStart(foo.firstChild, 1);
  range.setEnd(foo, 2);
  range.deleteContents();
  log(treeAsString(foo) + ". Final range (" + range.startContainer.nodeName + ", " + range.startOffset.toString() + ") - (" + range.endContainer.nodeName + ", " + range.endOffset.toString() + ")");

  foo = document.getElementsByTagName("FOO")[1];
  range.setStart(foo.firstChild.nextNode.firstChild, 1);
  range.setEnd(foo.lastChild, 1);
  range.deleteContents();
  log(treeAsString(foo) + ". Final range (" + range.startContainer.nodeName + ", " + range.startOffset.toString() + ") - (" + range.endContainer.nodeName + ", " + range.endOffset.toString() + ")");

  foo = document.getElementsByTagName("FOO")[2];
  range.setStart(foo.firstChild, 1);
  range.setEnd(foo.firstChild.nextNode.firstChild, 1);
  range.deleteContents();
  log(treeAsString(foo) + ". Final range (" + range.startContainer.nodeName + ", " + range.startOffset.toString() + ") - (" + range.endContainer.nodeName + ", " + range.endOffset.toString() + ")");

  foo = document.getElementsByTagName("FOO")[3];
  range.setStart(foo.firstChild.firstChild, 1);
  range.setEnd(foo.lastChild.firstChild, 1);
  range.deleteContents();
  log(treeAsString(foo) + ". Final range (" + range.startContainer.nodeName + ", " + range.startOffset.toString() + ") - (" + range.endContainer.nodeName + ", " + range.endOffset.toString() + ")");

  List result = document.getElementById('console').childNodes;
  debug('test0');
  shouldBe(result[0].data, '<FOO> [A, CD]. Final range (FOO, 1) - (FOO, 1)');
  shouldBe(result[1].data, '<FOO> [A, <MOO> [B], E]. Final range (FOO, 2) - (FOO, 2)');
  shouldBe(result[2].data, '<FOO> [X, <BAR> [W], Q]. Final range (FOO, 1) - (FOO, 1)');
  shouldBe(result[3].data, '<FOO> [<BAR1> [A], <BAR3> [D]]. Final range (FOO, 1) - (FOO, 1)');

}



/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests calls to setInnerHTML, setInnerText, and 
 * setOuterHTML to see what kind of DOM modifications they cause.
 * The calls are optimized to not do any work in cases where the DOM would
 * not change at all.
 * @needsreview is this relevant for dart?
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="results"></p>

    <div id="parent"></div>

    ''', treeSanitizer: new NullTreeSanitizer());

  var modified;
  var oldElement;
  var oldContent;
  var failureCount = 0;

  setModifiedFlag(_)
  {
    modified = true;
  }

  print(message)
  {
    var div = document.createElement("div");
    div.append(new Text(message));
    document.getElementById("results").append(div);
  }

  summarizeResult()
  {
    if (!modified)
      return "not modified";
    var parent = document.getElementById("parent");
    if (!identical(parent.firstChild, oldElement))
      return "replaced";
    if (!identical(oldElement.firstChild, oldContent))
      return "modified";
    return "modified, with same first child";
  }
  
  runTest(markup, propertyName, newValue, expectedResult)
  {
    var parent = document.getElementById("parent");
    parent.innerHtml = "<div>" + markup + "</div>";
    modified = false;
    oldElement = parent.firstChild;
    oldContent = parent.firstChild.firstChild;
    var resultValue;
    if (propertyName == 'innerHtml') {
      HtmlElement parentElement = parent.firstChild;
      parentElement.innerHtml = newValue;
      resultValue = parentElement.innerHtml;
    }
    if (propertyName == 'text') {
      parent.firstChild.text = newValue;
      resultValue = parent.firstChild.text;
    }
    var result = resultValue == newValue ? summarizeResult() : "modified incorrectly";
    var testName = 'starting with "' + markup + '", setting ' + propertyName + ' to "' + newValue + '"';
    if (result == expectedResult)
      print("PASS: " + testName);
    else {
      print("FAIL: " + testName + " -- " + result + ", but expected " + expectedResult);
      ++failureCount;
    }
    if (result == "modified incorrectly")
      print("value was " + resultValue);
  }

  var parent = document.getElementById("parent");
  parent.addEventListener("DOMSubtreeModified", setModifiedFlag, true);
  
  runTest('', 'innerHtml', '', 'not modified');
  runTest('', 'innerHtml', 'text', 'modified');
  runTest('', 'innerHtml', '<a></a>', 'modified');
  runTest('', 'innerHtml', '<a></a><b></b>', 'modified');

  runTest('text', 'innerHtml', '', 'modified');
  runTest('text', 'innerHtml', 'different text', 'modified, with same first child');
  runTest('text', 'innerHtml', 'text', 'not modified');
  runTest('text', 'innerHtml', '<a></a>', 'modified');
  runTest('text', 'innerHtml', '<a></a><b></b>', 'modified');

  runTest('<a></a>', 'innerHtml', '', 'modified');
  runTest('<a></a>', 'innerHtml', 'text', 'modified');
  runTest('<a></a>', 'innerHtml', '<a></a>', 'modified');
  runTest('<a></a>', 'innerHtml', '<a href=""></a>', 'modified');
  runTest('<a></a>', 'innerHtml', '<a>text</a>', 'modified');
  runTest('<a></a>', 'innerHtml', '<a></a><b></b>', 'modified');

  runTest('<a>text</a>', 'innerHtml', '<a>text</a>', 'modified');
  runTest('<a>text</a>', 'innerHtml', '<a>different text</a>', 'modified');

  runTest('<a href="b"></a>', 'innerHtml', '<a name="c" href="b"></a>', 'modified');
  runTest('<a href="b" name="c"></a>', 'innerHtml', '<a href="b" name="c"></a>', 'modified');
  runTest('<a href="b" name="c"></a>', 'innerHtml', '<a name="c" href="b"></a>', 'modified');

  runTest('', 'text', '', 'not modified');
  runTest('', 'text', 'text', 'modified');
  runTest('', 'text', '<a></a>', 'modified');
  runTest('', 'text', '<a></a><b></b>', 'modified');

  runTest('text', 'text', '', 'modified');
  runTest('text', 'text', 'different text', 'modified, with same first child');
  runTest('text', 'text', 'text', 'not modified');

  runTest('<a></a>', 'text', '', 'modified');
  runTest('<a></a>', 'text', 'text', 'modified');

  shouldBe(failureCount, 0);
}



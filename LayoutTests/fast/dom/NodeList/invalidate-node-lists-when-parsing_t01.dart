/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see if the DOM ContainerNode's NodeList
 * cache is correctly invalidated when new content is parsed.
 * If the test passes, you should see "before: not found", "after: found" and 
 * "onload: found".
 * If the cache is not invalidated when the testElement is parsed, both before 
 * and after will be "not found", which is a failure.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var result1, result2, result3;

  print(message)
  {
    var paragraph = document.createElement("li");
    paragraph.append(new Text(message));
    document.getElementById("console").append(paragraph);
  }

  containsElementWithId(el, id) {
    var found = false;

    if (el is Element && el.id == id) {
      found = true;
    } else {
      var children = el.childNodes;
      for (var i=0; !found && i < children.length; i++)
        found = containsElementWithId(children[i], id);            
    }

    return found;
  }

  testForElement(testName, elementId) {
    var found = containsElementWithId(document.body, elementId);
    // create lots of objects to force a garbage collection
    var i = 0;
    var s = '';
    while (i < 5000) {
      i = i+1.11;
      s = s + " ";
    }

    return testName + ": " + (found ? "found" : "not found");
  }

  runTest() {
    result3 = testForElement("onload", "testElement2");    // expect to see "testElement2"

    // don't show the results until the tests are finished -- it changes the DOM and could affect the tests
    print(result1);
    print(result2);
    print(result3);
  }


  document.body.appendHtml('<p><ol id=console></ol></p>');

  result1 = testForElement("before", "testElement");    // expect not to see "testElement"
  shouldBe(result1, 'before: not found');

  document.body.appendHtml('<p id="testElement"></p>');

  result2 = testForElement("after", "testElement");    // expect to see "testElement"
  shouldBe(result2, 'after: found');

  document.body.appendHtml('<p id="testElement2"></p>');

  runTest();
  shouldBe(result3, 'onload: found');
}

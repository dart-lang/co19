/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Fragment Mutation Tests
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.innerHtml = '';

  produceNodeNameString(nodes)
  {
    var node = nodes.firstChild;
    var result = "";
    while(node != null) {
      result += node.nodeName;
      node = node.nextNode;
    }
    return result;
  }

  expectException(code)
  {
    return (stash, exception) {
      shouldBeTrue(exception is DomException);
      shouldBe(exception.name, code);
    };
  }

  expectNodes(nodes)
  {
    return (stash, exception) {
      shouldBeNull(exception);
      var result = produceNodeNameString(stash);
      shouldBe(result, nodes);
    };
  }

  testFragment(method, description, mutationHandler, expectation,
               [nonStop=false])
  {
    debug(description);
    var once = 0;
    var logged = 0;
    var frag = document.createDocumentFragment();
    var stash = document.body.append(document.createElement("div"));
    frag.append(document.createElement("b"));
    frag.append(document.createElement("u"));
    frag.append(document.createElement("p"));
    frag.addEventListener("DOMSubtreeModified", (evt) {
      if (!nonStop && once++ > 0)
        return;

      try {
        mutationHandler(evt, frag, stash);
      }
      catch(e) {
        expectation(stash, e);
        logged++;
      }
    }, false);

    try {
      method(stash, frag);
    }
    catch(e) {
      expectation(stash, e);
      logged++;
    }

    if (logged == 0)
      expectation(stash, null /*exception*/);

    stash.remove();
  }

  appendChildMethod(object, subject)
    => object.append(subject);

  insertBeforeMethod(object, subject)
    => object.insertBefore(subject, object.firstChild);

  runTest(methodName, method)
  {
    var missing = document.body.append(document.createElement("em"));
    testFragment(method,
        methodName + "Inserting an element in front of the next item in fragment should not affect the result",
        (evt, frag, stash) {
          frag.insertBefore(missing, frag.firstChild);
        },
        expectNodes("BUP"));

    var extra = document.body.append(document.createElement("em"));
    testFragment(method,
        methodName + "Appending an element at the end of the fragment should not affect the result",
        (evt, frag, stash) {
          frag.append(extra);
        },
        expectNodes("BUP"));

    testFragment(method,
        methodName + "Continually re-appending removed element to the fragment should eventually throw NOT_FOUND_ERR",
        (evt, frag, stash) {
          stash.insertBefore(frag.lastChild, stash.firstChild);
        }, expectException(DomException.NOT_FOUND),
        true);
  }

  runTest("append: ", appendChildMethod);
  runTest("insertBefore: ", insertBeforeMethod);
}

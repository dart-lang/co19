/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that MutationObservers move correctly across documents
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;
  var div, subDiv;

  var runNextTest;

  testBasic() {
    var observer;

    finish() {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, div);
      shouldBe(mutations[0].attributeName, "id");
      shouldBe(mutations[0].attributeNamespace, null);
      observer.disconnect();
      debug('');
      runNextTest();
    }

    start() {
      debug('Testing basic aspects of cross-document observation.');

      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((_mutations, observer) {
        mutations = _mutations;
      });

      observer.observe(div, attributes: true);
      var newDoc = document.implementation.createDocument('', '', null);
      newDoc.append(div);
      div.id = 'foo';
      setTimeout(finish, 0);
    }

    start();
  }

  testSubtree() {
    var observer;

    finish() {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "id");
      shouldBe(mutations[0].attributeNamespace, null);
      observer.disconnect();
      debug('');
      runNextTest();
    }

    start() {
      debug('Testing that subtree observation works after node is moved.');

      mutations = null;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      observer = new MutationObserver((_mutations, observer) {
        mutations = _mutations;
      });

      observer.observe(div, attributes: true, subtree: true);
      var newDoc = document.implementation.createDocument('', '', null);
      newDoc.append(div);
      subDiv.id = 'foo';
      setTimeout(finish, 0);
    }

    start();
  }

  var tests = [testBasic, testSubtree];
  var testIndex = 0;

  runNextTest = () {
    if (testIndex < tests.length)
      tests[testIndex++]();
    else
      asyncEnd();
  };

  asyncStart();
  runNextTest();
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Inserting DocumentFragments should remove all children of the
 * fragment before inserting the children.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations, observer;

  createObservedFragment() {
    var fragment = document.createDocumentFragment();
    fragment.append(document.createElement('b'));
    fragment.append(document.createElement('i'));
    observer.observe(fragment, childList: true);
    return fragment;
  }

  callback(_mutations, observer) {
    mutations = _mutations;
  }
  observer = new MutationObserver(callback);

  testReplaceChild() {
    debug('Testing replaceChild');
    var div = document.createElement('div');
    div.append(document.createElement('span'));
    observer.observe(div, childList: true);
    div.firstChild.replaceWith(createObservedFragment());
    setTimeout(() {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].addedNodes.length, 0);
      shouldBe(mutations[0].removedNodes.length, 2);
      shouldBe(mutations[1].addedNodes.length, 2);
      shouldBe(mutations[1].removedNodes.length, 1);
      asyncEnd();
    }, 0);
  }

  testInsertBefore() {
    debug('Testing insertBefore');
    var div = document.createElement('div');
    div.append(document.createElement('span'));
    observer.observe(div, childList: true);
    div.insertBefore(createObservedFragment(), div.firstChild);
    setTimeout(() {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].addedNodes.length, 0);
      shouldBe(mutations[0].removedNodes.length, 2);
      shouldBe(mutations[1].addedNodes.length, 2);
      shouldBe(mutations[1].removedNodes.length, 0);
      testReplaceChild();
    }, 0);
  }

  testAppendChild() {
    debug('Testing append');
    var div = document.createElement('div');
    observer.observe(div, childList: true);
    div.append(createObservedFragment());
    setTimeout(() {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].addedNodes.length, 0);
      shouldBe(mutations[0].removedNodes.length, 2);
      shouldBe(mutations[1].addedNodes.length, 2);
      shouldBe(mutations[1].removedNodes.length, 0);
      testInsertBefore();
    }, 0);
  }

  asyncStart();
  testAppendChild();
}

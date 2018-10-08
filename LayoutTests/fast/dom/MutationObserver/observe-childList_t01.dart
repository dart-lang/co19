/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test WebKitMutationObserver.observe on attributes.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations, mutations2;
  var calls;
  var div, removedDiv1, removedDiv2, addedDiv1, addedDiv2, addedDiv3;
  var runNextTest;

  testBasic() {
    var div;
    var observer;
    var checkDisconnectAndMutate;
    var checkNotDeliveredAndMutateMultiple;
    var finish;

    start() {
      debug('Testing basic aspects of childList observation.');

      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true);
      removedDiv1 = div.append(document.createElement('div'));
      setTimeout(checkDisconnectAndMutate, 0);
    }

    checkDisconnectAndMutate = () {
      debug('...can childList changes be observed at all');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 1);
      shouldBe(mutations[0].addedNodes[0], removedDiv1);

      mutations = null;
      observer.disconnect();
      removedDiv1 = div.append(document.createElement('div'));
      setTimeout(checkNotDeliveredAndMutateMultiple, 0);
    };

    checkNotDeliveredAndMutateMultiple = () {
      debug('...observer.disconnect() should prevent further delivery of mutations.');

      shouldBe(mutations, null);
      observer.observe(div, childList: true);
      removedDiv1 = div.firstChild..remove();
      removedDiv2 = div.firstChild..remove();
      setTimeout(finish);
    };

    finish = () {
      debug('...re-observing after disconnect works with the same observer.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].removedNodes.length, 1);
      shouldBe(mutations[0].removedNodes[0], removedDiv1);
      shouldBe(mutations[1].type, "childList");
      shouldBe(mutations[1].removedNodes.length, 1);
      shouldBe(mutations[1].removedNodes[0], removedDiv2);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testWrongType() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing that observing without specifying "childList" does not result in hearing about childList changes.');

      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true);
      div.append(document.createElement('div'));
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations, null);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testMultipleRegistration() {
    var div;
    var observer;
    var checkDisconnectAndMutate;
    var finish;

    start() {
      debug('Testing that re-observing the same node with the same observer has the effect of resetting the options.');

      calls = 0;
      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
        calls++;
      });

      observer.observe(div, childList: true, characterData: true);
      observer.observe(div, childList: true);
      div.append(document.createElement('div'));
      setTimeout(checkDisconnectAndMutate, 0);
    }

    checkDisconnectAndMutate = () {
      shouldBe(calls, 1);
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      mutations = null;
      observer.observe(div, childList: true, characterData: true);
      observer.observe(div, attributes: true);
      div.append(document.createElement('div'));
      setTimeout(finish, 0);
    };

    finish = () {
      shouldBe(mutations, null);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testMultipleObservers() {
    var div;
    var observer;
    var observer2;
    var finish;

    start() {
      debug('Testing that multiple observers can be registered to a given node and both receive mutations.');
      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer2 = new MutationObserver((m,o) {
        mutations2 = m;
      });
      observer.observe(div, childList: true);
      observer2.observe(div, childList: true);
      div.append(document.createElement('div'));
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations2.length, 1);
      shouldBe(mutations2[0].type, "childList");
      observer.disconnect();
      observer2.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testInnerHTMLAndInnerText() {
    var div;
    var observer;
    var checkInnerHTML;
    var finish;

    start() {
      debug('Testing that text and innerHTML always result in a single childList mutation.');

      mutations = null;
      div = document.createElement('div');
      div.innerHtml = '<span>Foo</span><div>Bar</div>';
      removedDiv1 = div.firstChild;
      removedDiv2 = removedDiv1.nextNode;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true);
      div.innerHtml = 'foo<img src="bar.png"><p>Baz</p>';
      addedDiv1 = div.childNodes[0];
      addedDiv2 = div.childNodes[1];
      addedDiv3 = div.childNodes[2];
      setTimeout(checkInnerHTML, 0);
    }

    checkInnerHTML = () {
      debug('...innerHTML');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 3);
      shouldBe(mutations[0].addedNodes[0], addedDiv1);
      shouldBe(mutations[0].addedNodes[1], addedDiv2);
      shouldBe(mutations[0].addedNodes[2], addedDiv3);
      shouldBe(mutations[0].removedNodes.length, 2);
      shouldBe(mutations[0].removedNodes[0], removedDiv1);
      shouldBe(mutations[0].removedNodes[1], removedDiv2);

      mutations = null;
      div.text = 'foo';
      setTimeout(finish, 0);
    };

    finish = () {
      debug('...text');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 1);
      shouldBe(mutations[0].removedNodes.length, 3);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testReplaceChild() {
    var div;
    var observer;
    var fragment;
    var checkReplaceWithNode;
    var finish;

    start() {
      debug('Testing that replaceChild results in minimal childList mutations.');

      mutations = null;
      div = document.createElement('div');
      div.innerHtml = '<span>Foo</span><div>Bar</div>';
      removedDiv1 = div.firstChild;

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true);
      addedDiv1 = document.createElement('div');
      div.firstChild.replaceWith(addedDiv1);
      setTimeout(checkReplaceWithNode, 0);
    }

    checkReplaceWithNode = () {
      debug('...simple replace child');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 1);
      shouldBe(mutations[0].addedNodes[0], addedDiv1);
      shouldBe(mutations[0].removedNodes.length, 1);
      shouldBe(mutations[0].removedNodes[0], removedDiv1);

      mutations = null;
      fragment = document.createDocumentFragment();
      addedDiv1 = fragment.append(document.createElement('div'));
      addedDiv2 = fragment.append(document.createElement('div'));
      removedDiv1 = div.firstChild;

      removedDiv1.replaceWith(fragment);

      setTimeout(finish, 0);
    };

    finish = () {
      debug('...replace with DocumentFragment');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 2);
      shouldBe(mutations[0].addedNodes[0], addedDiv1);
      shouldBe(mutations[0].addedNodes[1], addedDiv2);
      shouldBe(mutations[0].removedNodes.length, 1);
      shouldBe(mutations[0].removedNodes[0], removedDiv1);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testInsertBefore() {
    var div;
    var observer;
    var fragment;
    var finish;

    start() {
      debug('Testing that insertBefore results in minimal childList mutations.');

      mutations = null;
      div = document.createElement('div');
      div.innerHtml = '<span>Foo</span>';
      fragment = document.createDocumentFragment();
      addedDiv1 = fragment.append(document.createElement('div'));
      addedDiv2 = fragment.append(document.createElement('div'));

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true);
      div.insertBefore(fragment, div.firstChild);
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 2);
      shouldBe(mutations[0].addedNodes[0], addedDiv1);
      shouldBe(mutations[0].addedNodes[1], addedDiv2);
      shouldBe(mutations[0].removedNodes.length, 0);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testAppendChild() {
    var div;
    var observer;
    var fragment;
    var finish;

    start() {
      debug('Testing that append results in minimal childList mutations.');

      mutations = null;
      div = document.createElement('div');
      div.innerHtml = '<span>Foo</span>';
      fragment = document.createDocumentFragment();
      addedDiv1 = fragment.append(document.createElement('div'));
      addedDiv2 = fragment.append(document.createElement('div'));

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true);
      div.append(fragment);
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "childList");
      shouldBe(mutations[0].addedNodes.length, 2);
      shouldBe(mutations[0].addedNodes[0], addedDiv1);
      shouldBe(mutations[0].addedNodes[1], addedDiv2);
      shouldBe(mutations[0].removedNodes.length, 0);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testInnerHTMLEmpty() {
    var observer;
    var finish;

    start() {
      debug('Setting an empty childlist to the empty string with innerHTML should not assert.');

      var div = document.createElement('div');
      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(div, childList: true);
      div.innerHtml = '';
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBeNull(mutations);
      debug('');
      runNextTest();
    };

    start();
  }

  var tests = [
    testBasic,
    testWrongType,
    testMultipleRegistration,
    testMultipleObservers,
    testInnerHTMLAndInnerText,
    testReplaceChild,
    testInsertBefore,
    testAppendChild,
    testInnerHTMLEmpty
  ];
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

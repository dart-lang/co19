/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test WebKitMutationObserver.observe on CharacterData nodes
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;
  var mutations2;
  var mutationsWithOldValue;
  var charDataNode;
  var runNextTest;

  testBasic() {
    var div;
    var observer;
    var checkDisconnectAndMutate;
    var checkNotDeliveredAndMutateMultiple;
    var finish;

    start() {
      debug('Testing basic aspects of characterData observation.');

      mutations = null;
      div = document.createElement('div');
      div.text = 'foo';
      charDataNode = div.firstChild;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(charDataNode, characterData: true);
      charDataNode.text = 'bar';
      setTimeout(checkDisconnectAndMutate, 0);
    }

    checkDisconnectAndMutate = () {
      debug('...can characterData changes be observed at all');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].target, charDataNode);

      mutations = null;
      observer.disconnect();
      charDataNode.text = 'baz';
      setTimeout(checkNotDeliveredAndMutateMultiple, 0);
    };

    checkNotDeliveredAndMutateMultiple = () {
      debug('...observer.disconnect() should prevent further delivery of mutations.');

      shouldBe(mutations, null);
      charDataNode = new Comment('');
      observer.observe(charDataNode, characterData: true);
      charDataNode.text = 'foo';
      charDataNode.text = 'bar';
      setTimeout(finish);
    };

    finish = () {
      debug('...re-observing after disconnect works with the same observer.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].target, charDataNode);
      shouldBe(mutations[1].type, "characterData");
      shouldBe(mutations[1].target, charDataNode);
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
      debug('Testing that observing without specifying "characterData" does not result in hearing about characterData changes.');

      mutations = null;
      div = document.createElement('div');
      div.text = 'hello';
      charDataNode = div.firstChild;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(charDataNode, childList: true, attributes: true);
      charDataNode = 'goodbye';
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

  testMultipleObservers() {
    var div;
    var observer;
    var observer2;
    var finish;

    start() {
      debug('Testing that multiple observers can be registered to a given node and both receive mutations.');
      mutations = null;
      div = document.createElement('div');
      div.text = 'foo';
      charDataNode = div.firstChild;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer2 = new MutationObserver((m,o) {
        mutations2 = m;
      });
      observer.observe(charDataNode, characterData: true);
      observer2.observe(charDataNode, characterData: true);
      charDataNode.text = 'bar';
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].target, charDataNode);
      shouldBe(mutations2.length, 1);
      shouldBe(mutations2[0].type, "characterData");
      shouldBe(mutations2[0].target, charDataNode);
      observer.disconnect();
      observer2.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testOrderingWrtDOMSubtreeModified() {
    var div, div2, subDiv;
    var observer;
    var listener;
    var finish;

    start() {
      debug('Testing mutation records are enqueued for characterData before DOMSubtreeModified is dispatched.');

      mutations = null;
      div = document.body.append(document.createElement('div'));
      div2 = document.body.append(document.createElement('div'));

      subDiv = div.append(document.createElement('div'));
      subDiv.text = 'foo';
      charDataNode = subDiv.firstChild;

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      listener = (e) {
        div2.setAttribute('baz', 'bat');
      };

      div.addEventListener('DOMSubtreeModified', listener);
      observer.observe(charDataNode, characterData: true);
      observer.observe(div2, attributes: true);

      charDataNode.text = 'bar';

      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[1].type, "attributes");
      div.removeEventListener('DOMSubtreeModified', listener);
      div.remove();
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testOldValue() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing that oldValue is returned when requested.');
      mutations = null;
      div = document.createElement('div');
      div.text = 'foo';
      charDataNode = div.firstChild;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(charDataNode, characterData: true, characterDataOldValue: true);
      charDataNode.text = 'bar';
      charDataNode.text = 'baz';
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].target, charDataNode);
      shouldBe(mutations[0].oldValue, "foo");
      shouldBe(mutations[1].type, "characterData");
      shouldBe(mutations[1].target, charDataNode);
      shouldBe(mutations[1].oldValue, "bar");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testOldValueAsRequested() {
    var div;
    var observerWithOldValue;
    var observer;
    var finish;

    start() {
      debug('Testing that oldValue is delivered as requested (or not).');
      mutations = null;
      mutationsWithOldValue = null;
      div = document.createElement('div');
      div.text = 'foo';
      charDataNode = div.firstChild;
      observerWithOldValue = new MutationObserver((m,o) {
        mutationsWithOldValue = m;
      });
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observerWithOldValue.observe(charDataNode, characterData: true, characterDataOldValue: true);
      observer.observe(charDataNode, characterData: true);
      charDataNode.text = 'bar';
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutationsWithOldValue.length, 1);
      shouldBe(mutationsWithOldValue[0].type, "characterData");
      shouldBe(mutationsWithOldValue[0].oldValue, "foo");
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].oldValue, null);
      observerWithOldValue.disconnect();
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testOldValueUnionMultipleObservations() {
    var div;
    var observer;
    var finish;

    start() {
      debug('An observer with multiple observations will get characterDataOldValue if any entries request it.');
      mutations = null;
      div = document.createElement('div');
      div.text = 'foo';
      charDataNode = div.firstChild;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(div, characterData: true, characterDataOldValue: true, subtree: true);
      observer.observe(charDataNode, characterData: true);
      charDataNode.text = 'bar';
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].oldValue, "foo");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  var tests = [
    testBasic,
    testWrongType,
    testMultipleObservers,
    testOrderingWrtDOMSubtreeModified,
    testOldValue,
    testOldValueAsRequested,
    testOldValueUnionMultipleObservations
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

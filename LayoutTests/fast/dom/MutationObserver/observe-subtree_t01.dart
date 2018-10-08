/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test WebKitMutationObserver.observe on a subtree
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;
  var mutations2;
  var div;
  var subDiv, subDiv2, subDiv3, text;
  var calls;
  var runNextTest;

  testBasic() {
    var observer;
    var finish;

    start() {
      debug('Testing basic aspects of subtree observation.');

      mutations = null;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      subDiv.innerHtml = 'hello, world';
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true, subtree: true);
      subDiv.setAttribute('foo', 'bar');
      subDiv.firstChild.text = 'goodbye!';
      setTimeout(finish, 0);
    }

    finish = () {
      debug('...attribute and characterData changes in subtree');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "characterData");
      shouldBe(mutations[1].target, subDiv.firstChild);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }
  
  testMultipleObservers() {
    var observer;
    var observer2;
    var finish;

    start() {
      debug('Testing two observers at different depths.');

      mutations = null;
      mutations2 = null;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer2 = new MutationObserver((m,o) {
        mutations2 = m;
      });

      observer.observe(div, attributes: true, subtree: true);
      observer2.observe(subDiv, attributes: true);
      subDiv.setAttribute('foo', 'bar');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations2.length, 1);
      shouldBe(mutations2[0].type, "attributes");
      shouldBe(mutations2[0].target, subDiv);
      shouldBe(mutations2[0].attributeName, "foo");
      shouldBe(mutations2[0].attributeNamespace, null);
      observer.disconnect();
      observer2.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testMultipleObservations() {
    var observer;
    var finish;

    start() {
      debug('Testing one observer at two different depths.');

      mutations = null;
      calls = 0;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      observer = new MutationObserver((m,o) {
        mutations = m;
        ++calls;
      });

      observer.observe(div, attributes: true, subtree: true);
      observer.observe(subDiv, attributes: true, subtree: true);
      subDiv.setAttribute('foo', 'bar');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(calls, 1);
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testTransientDetachedBasic() {
    var observer;
    var checkDeliveredAndChangeAgain;
    var checkNotDeliveredAndReattach;
    var checkDeliveredAndReobserve;
    var finish;

    start() {
      debug('Testing that transiently detached nodes are still observed via subtree.');

      mutations = null;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      subDiv.innerHtml = 'hello, world';
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true, subtree: true);
      subDiv.setAttribute('foo', 'bar');
      subDiv.remove();
      subDiv.setAttribute('test', 'test');
      setTimeout(checkDeliveredAndChangeAgain, 0);
    }

    checkDeliveredAndChangeAgain = () {
      debug('...both changes should be received. Change detached subDiv again.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].target, subDiv);
      shouldBe(mutations[1].attributeName, "test");

      mutations = null;
      subDiv.setAttribute('foo', 'baz');

      setTimeout(checkNotDeliveredAndReattach);
    };

    checkNotDeliveredAndReattach = () {
      debug('...transient subtree observation was stopped after delivery, so subDiv change should not be received. Reattach and change again.');

      shouldBe(mutations, null);

      mutations = null;
      div.append(subDiv);
      subDiv.setAttribute('foo', 'bat');

      setTimeout(checkDeliveredAndReobserve);
    };

    checkDeliveredAndReobserve = () {
      debug('...reattached subtree should now be observable. Try detaching and re-observing.');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");

      mutations = null;
      subDiv.remove();
      subDiv.firstChild.text = 'badbye';
      observer.observe(div, attributes: true, characterData: true, subtree: true);
      subDiv.setAttribute('foo', 'boo');

      setTimeout(finish);
    };


    finish = () {
      debug('...The change made before re-observing should be received, but not the one after.');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "characterData");
      shouldBe(mutations[0].target, subDiv.firstChild);

      observer.disconnect();
      debug('');
      runNextTest();
    };
    start();
  }

  testTransientDetachedDetailed() {
    var observer;
    var finish;

    start() {
      debug('Testing correct behavior of transient observation with complex movement .');

      mutations = null;
      div = document.createElement('div');
      subDiv = div.append(document.createElement('div'));
      subDiv2 = subDiv.append(document.createElement('div'));
      subDiv2.innerHtml = 'hello, world';
      subDiv3 = document.createElement('div');

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true, subtree: true);
      subDiv.remove();
      subDiv2.remove();
      text = subDiv2.firstChild..remove();

      subDiv.setAttribute('a', 'a');
      subDiv2.setAttribute('b', 'b');
      text.text = 'c';
      subDiv3.append(subDiv2);
      subDiv3.setAttribute('d', 'd');
      subDiv2.setAttribute('e', 'e');
      div.append(subDiv3);
      subDiv3.setAttribute('f', 'f');
      subDiv2.setAttribute('g', 'g');

      setTimeout(finish, 0);
    }

    finish = () {
      debug('...All changes should be received except for setting the "d" attribute on subDiv3 before it was reachable from div.');

      shouldBe(mutations.length, 6);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "a");

      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].target, subDiv2);
      shouldBe(mutations[1].attributeName, "b");

      shouldBe(mutations[2].type, "characterData");
      shouldBe(mutations[2].target, text);

      shouldBe(mutations[3].type, "attributes");
      shouldBe(mutations[3].target, subDiv2);
      shouldBe(mutations[3].attributeName, "e");

      shouldBe(mutations[4].type, "attributes");
      shouldBe(mutations[4].target, subDiv3);
      shouldBe(mutations[4].attributeName, "f");

      shouldBe(mutations[5].type, "attributes");
      shouldBe(mutations[5].target, subDiv2);
      shouldBe(mutations[5].attributeName, "g");

      observer.disconnect();
      debug('');
      runNextTest();
    };
    start();
  }

  var tests = [
    testBasic,
    testMultipleObservers,
    testMultipleObservations,
    testTransientDetachedBasic,
    testTransientDetachedDetailed
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

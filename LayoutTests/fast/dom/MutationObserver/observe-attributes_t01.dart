/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test WebKitMutationObserver.observe on attributes
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations, mutations2, mutationsWithOldValue;
  var calls;

  var runNextTest;

  testBasic() {
    var div;
    var observer;
    var checkDisconnectAndMutate;
    var checkNotDeliveredAndMutateMultiple;
    var finish;

    start() {
      debug('Testing basic aspects of attribute observation.');

      mutations = null;
      div = document.createElement('div');
      div.setAttribute('bar', 'foo');

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, characterData: true);
      div.setAttribute('foo', 'bar');
      div.attributes.remove('bar');
      setTimeout(checkDisconnectAndMutate, 0);
    }

    checkDisconnectAndMutate = () {
      debug('...can attribute changes be observed at all');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "bar");
      shouldBe(mutations[1].attributeNamespace, null);

      mutations = null;
      observer.disconnect();
      div.setAttribute('foo', 'baz');
      setTimeout(checkNotDeliveredAndMutateMultiple, 0);
    };

    checkNotDeliveredAndMutateMultiple = () {
      debug('...observer.disconnect() should prevent further delivery of mutations.');

      shouldBe(mutations, null);
      observer.observe(div, attributes: true);
      div.setAttribute('foo', 'bat');
      div.setAttribute('bar', 'foo');
      setTimeout(finish, 0);
    };

    finish = () {
      debug('...re-observing after disconnect works with the same observer.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "bar");
      shouldBe(mutations[1].attributeNamespace, null);
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
      debug('Testing that observing without specifying "attributes" does not result in hearing about attribute changes.');

      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, childList: true, characterData: true);
      div.setAttribute('foo', 'bar');
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

      observer.observe(div, attributes: true, characterData: true);
      observer.observe(div, attributes: true);
      div.setAttribute('foo', 'bar');
      setTimeout(checkDisconnectAndMutate, 0);
    }

    checkDisconnectAndMutate = () {
      shouldBe(calls, 1);
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      mutations = null;
      observer.observe(div, attributes: true, characterData: true);
      observer.observe(div, childList: true);
      div.setAttribute('foo', 'baz');
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
      observer.observe(div, attributes: true);
      observer2.observe(div, attributes: true);
      div.setAttribute('foo', 'bar');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations2.length, 1);
      shouldBe(mutations2[0].type, "attributes");
      shouldBe(mutations2[0].attributeName, "foo");
      observer.disconnect();
      observer2.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testNamespaceURI() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing that "attributeNamespace" value is delivered properly.');
      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(div, attributes: true, childList: true);
      div.setAttributeNS('http://www.foo.com/bar', 'foo', 'bar');
      setTimeout(finish, 0);    
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, "http://www.foo.com/bar");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testPropertyAccess() {
    var img, a;
    var observer;
    var finish;

    start() {
      debug('Testing that modifications to node properties which delegate to attribute storage deliver mutations.');
      mutations = null;
      img = document.createElement('img');
      a = document.createElement('a');

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      observer.observe(img, attributes: true);
      observer.observe(a, attributes: true);

      img.src = 'IntentionallyMissingFile.png';
      a.href = 'foo.html';

      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "src");
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "href");
      observer.disconnect();
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
      debug('Testing mutation records are enqueued for attributes before DOMSubtreeModified is dispatched.');

      mutations = null;
      div = document.body.append(document.createElement('div'));
      div2 = document.body.append(document.createElement('div'));

      subDiv = div.append(document.createElement('div'));

      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      listener = (e) {
        div2.setAttribute('baz', 'bat');
      };

      div.addEventListener('DOMSubtreeModified', listener);
      observer.observe(subDiv, attributes: true);
      observer.observe(div2, attributes: true);

      subDiv.setAttribute('foo', 'bar');

      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "baz");
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
      debug('Testing basic oldValue delivery.');
      mutations = null;
      div = document.createElement('div');
      div.setAttribute('bar', 'boo');

      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(div, attributes: true, attributeOldValue: true);
      div.setAttribute('foo', 'bar');
      div.setAttribute('foo', 'baz');
      div.attributes.remove('bar');
      div.attributes.remove('non-existant');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].oldValue, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "foo");
      shouldBe(mutations[1].oldValue, "bar");
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "bar");
      shouldBe(mutations[2].oldValue, "boo");
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
      mutationsWithOldValue = null;
      mutations = null;
      div = document.createElement('div');
      div.setAttribute('foo', 'bar');
      observerWithOldValue = new MutationObserver((m,o) {
        mutationsWithOldValue = m;
      });
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observerWithOldValue.observe(div, attributes: true, attributeOldValue: true);
      observer.observe(div, attributes: true);
      div.setAttribute('foo', 'baz');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutationsWithOldValue.length, 1);
      shouldBe(mutationsWithOldValue[0].type, "attributes");
      shouldBe(mutationsWithOldValue[0].attributeName, "foo");
      shouldBe(mutationsWithOldValue[0].oldValue, "bar");
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
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
    var span;
    var observer;
    var finish;

    start() {
      debug('An observer with multiple observations will get attributeOldValue if any entries request it.');
      mutations = null;
      div = document.createElement('div');
      span = div.append(document.createElement('span'));
      span.setAttribute('foo', 'bar');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(div, attributes: true, attributeOldValue: true, subtree: true);
      observer.observe(span, attributes: true);
      span.setAttribute('foo', 'baz');
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].oldValue, "bar");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testIDLAttribute() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing setting an attribute via reflected IDL attribute.');
      mutations = null;
      div = document.createElement('div');
      observer = new MutationObserver((m,o) {
        mutations = m;
      });
      observer.observe(div, attributes: true, attributeOldValue: true);
      div.id = 'foo';
      div.id = 'bar';
      div.id = null;
      setTimeout(finish, 0);
    }

    finish = () {
      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "id");
      shouldBe(mutations[0].oldValue, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "id");
      shouldBe(mutations[1].oldValue, "foo");
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "id");
      shouldBe(mutations[2].oldValue, "bar");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testAttributeFilter() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing that attributeFilter works as expected and observes case with HTML elements.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = document.createElement('div');
      observer.observe(div, attributes: true, attributeFilter: ['foo', 'bar', 'booM']);
      div.setAttribute('foo', 'foo');
      div.setAttribute('bar', 'bar');
      div.setAttribute('baz', 'baz');
      div.setAttribute('BOOm', 'boom');

      setTimeout(finish, 0);
    }

    finish = () {
      debug('...only foo and bar should be received.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "bar");
      shouldBe(mutations[1].attributeNamespace, null);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testAttributeFilterSubtree() {
    var div, div2, div3;
    var observer;
    var checkAndObserveAll;
    var finish;

    start() {
      debug('Testing the behavior of attributeFilter when the same observer observes at multiple nodes in a subtree with different filter options.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = document.createElement('div');
      div2 = div.append(document.createElement('div'));
      div3 = div2.append(document.createElement('div'));

      observer.observe(div, attributes: true, subtree: true, attributeFilter: ['foo', 'bar']);
      observer.observe(div2, attributes: true, subtree: true, attributeFilter: ['bar', 'bat']);

      div3.setAttribute('foo', 'foo');
      div3.setAttribute('bar', 'bar');
      div3.setAttribute('bat', 'bat');
      div3.setAttribute('baz', 'baz');

      setTimeout(checkAndObserveAll, 0);
    }

    checkAndObserveAll = () {
      debug('...only foo, bar & bat should be received.');

      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "bar");
      shouldBe(mutations[1].attributeNamespace, null);
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "bat");
      shouldBe(mutations[2].attributeNamespace, null);

      observer.observe(div2, attributes: true, subtree: true);
      div3.setAttribute('bar', 'bar');
      div3.setAttribute('bat', 'bat');
      div3.setAttribute('baz', 'baz');

      setTimeout(finish, 0);
    };

    finish = () {
      debug('...bar, bat & baz should all be received.');

      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "bar");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "bat");
      shouldBe(mutations[1].attributeNamespace, null);
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "baz");
      shouldBe(mutations[2].attributeNamespace, null);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testAttributeFilterNonHTMLElement() {
    var path;
    var observer;
    var finish;

    start() {
      debug('Testing that setting an attributeFilter filters out namespaced attributes.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
      observer.observe(path, attributes: true, attributeFilter: ['pathLength']);
      path.setAttributeNS('http://www.w3.org/2000/svg', 'pathLength', '200');

      setTimeout(finish, 0);
    }

    finish = () {
      debug('...pathLength should not be received.');

      shouldBeNull(mutations);
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testAttributeFilterNonHTMLDocument() {
    var svgDoc, div;
    var observer;
    var finish;

    start() {
      debug('Testing that attributeFilter respects case with non-HTML elements.');
      var docType = document.implementation.createDocumentType('svg',
          '-//W3C//DTD SVG 1.1//EN',
          'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');

      svgDoc = document.implementation.createDocument('http://www.w3.org/2000/svg', 'svg', docType);
      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = svgDoc.createElement('div');
      observer.observe(div, attributes: true, attributeFilter: ['ID', 'id', 'booM']);
      div.setAttribute('ID', 'ID');
      div.setAttribute('id', 'id');
      div.setAttribute('baz', 'baz');
      div.setAttribute('booM', 'boom');
      div.setAttribute('BOOm', 'boom');

      setTimeout(finish, 0);
    }

    finish = () {
      debug('...only ID, id, booM should be received.');

      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "ID");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "id");
      shouldBe(mutations[1].attributeNamespace, null);
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "booM");
      shouldBe(mutations[2].attributeNamespace, null);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testStyleAttributePropertyAccess() {
    var div;
    var observer;
    var checkAndContinue;
    var finish;

    start() {
      debug('Testing that modifying an elements style property dispatches Mutation Records.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = document.createElement('div');
      div.setAttribute('style', 'color: yellow; width: 100px;');
      observer.observe(div, attributes: true);
      div.style.color = 'red';
      div.style.width = '200px';
      div.style.color = 'blue';

      setTimeout(checkAndContinue, 0);
    }

    checkAndContinue = () {
      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "style");
      shouldBe(mutations[0].oldValue, null);
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "style");
      shouldBe(mutations[1].oldValue, null);
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "style");
      shouldBe(mutations[2].oldValue, null);

      mutations = null;
      div.getAttribute('style');
      setTimeout(finish, 0);
    };

    finish = () {
      debug('...mutation record created.');

      shouldBe(mutations, null);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testStyleAttributePropertyAccessOldValue() {
    var div;
    var observer;
    var checkAndContinue;
    var finish;

    start() {
      debug('Testing that modifying an elements style property dispatches Mutation Records with correct oldValues.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = document.createElement('div');
      div.setAttribute('style', 'color: yellow; width: 100px;');
      observer.observe(div, attributes: true, attributeOldValue: true);
      div.style.color = 'red';
      div.style.width = '200px';
      div.style.color = 'blue';

      setTimeout(checkAndContinue, 0);
    }

    checkAndContinue = () {
      shouldBe(mutations.length, 3);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].attributeName, "style");
      shouldBe(mutations[0].oldValue, "color: yellow; width: 100px;");
      shouldBe(mutations[1].type, "attributes");
      shouldBe(mutations[1].attributeName, "style");
      shouldBe(mutations[1].oldValue, "color: red; width: 100px;");
      shouldBe(mutations[2].type, "attributes");
      shouldBe(mutations[2].attributeName, "style");
      shouldBe(mutations[2].oldValue, "color: red; width: 200px;");

      mutations = null;
      div.getAttribute('style');
      setTimeout(finish, 0);
    };

    finish = () {
      debug('...mutation record created.');

      shouldBe(mutations, null);

      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  testStyleAttributePropertyAccessIgnoreNoop() {
    var div;
    var observer;
    var finish;

    start() {
      debug('Testing that a no-op style property mutation does not create Mutation Records.');

      mutations = null;
      observer = new MutationObserver((m,o) {
        mutations = m;
      });

      div = document.createElement('div');
      div.setAttribute('style', 'color: yellow; width: 100px;');
      observer.observe(div, attributes: true);
      div.style.removeProperty('height');

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

  var tests = [
    testBasic,
    testWrongType,
    testMultipleRegistration,
    testMultipleObservers,
    testNamespaceURI,
    testPropertyAccess,
    testOrderingWrtDOMSubtreeModified,
    testOldValue,
    testOldValueAsRequested,
    testOldValueUnionMultipleObservations,
    testIDLAttribute,
    testAttributeFilter,
    testAttributeFilterSubtree,
    testAttributeFilterNonHTMLElement,
    testAttributeFilterNonHTMLDocument, // crashes
    testStyleAttributePropertyAccess,
    testStyleAttributePropertyAccessOldValue,
    testStyleAttributePropertyAccessIgnoreNoop,

    //Removed non applicable to dart sub-tests
    //testMutateThroughAttrNodeValue,
    //testMutateThroughAttrNodeChild,
    //testSetAndRemoveAttributeNode,
    //testMixedNodeAndElementOperations,
    //testNamedNodeMapOperations
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

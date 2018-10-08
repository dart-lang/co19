/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Testing WebKitMutationObserver.takeRecords
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;
  var div;
  var subDiv;
  var runNextTest;

  testBasic() {
    var observer;
    var finish;

    start() {
      debug('Testing takeRecords.');

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
      subDiv.remove();

      mutations = observer.takeRecords();

      debug('...records are taken synchronously.');

      shouldBe(mutations.length, 2);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      shouldBe(mutations[0].attributeNamespace, null);
      shouldBe(mutations[1].type, "characterData");
      shouldBe(mutations[1].target, subDiv.firstChild);

      subDiv.setAttribute('foo', 'baz');
      setTimeout(finish, 0);
    }

    finish = () {
      debug('...takeRecord took records, but did not clear transient observers');

      shouldBe(mutations.length, 1);
      shouldBe(mutations[0].type, "attributes");
      shouldBe(mutations[0].target, subDiv);
      shouldBe(mutations[0].attributeName, "foo");
      observer.disconnect();
      debug('');
      runNextTest();
    };

    start();
  }

  var tests = [testBasic];
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

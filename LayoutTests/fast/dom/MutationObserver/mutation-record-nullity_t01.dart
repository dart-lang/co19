/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Non-relevant properties on mutation records should be null, 
 * except for NodeLists, which should be empty
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var observer = new MutationObserver((m,o) {});

  var text = new Text('something');
  observer.observe(text, characterData: true);
  text.data = 'something else';
  var record = observer.takeRecords()[0];
  debug('characterData record:');
  shouldBeNull(record.attributeName);
  shouldBeNull(record.attributeNamespace);
  shouldBeNull(record.oldValue);
  shouldBeNull(record.previousSibling);
  shouldBeNull(record.nextSibling);
  shouldBe(record.addedNodes.length, 0);
  shouldBe(record.removedNodes.length, 0);

  var div = document.createElement('div');
  observer.observe(div, childList: true);
  div.append(document.createElement('span'));
  record = observer.takeRecords()[0];
  debug('childList record:');
  shouldBeNull(record.attributeName);
  shouldBeNull(record.attributeNamespace);
  shouldBeNull(record.oldValue);

  observer.observe(div, attributes: true);
  div.setAttribute('data-foo', 'bar');
  record = observer.takeRecords()[0];
  debug('attributes record:');
  shouldBeNull(record.attributeNamespace);
  shouldBeNull(record.oldValue);
  shouldBeNull(record.previousSibling);
  shouldBeNull(record.nextSibling);
  shouldBe(record.addedNodes.length, 0);
  shouldBe(record.removedNodes.length, 0);
}

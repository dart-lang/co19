/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test MutationObserver.observe options related to attributes
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var observer = new MutationObserver((m,o) {});
  var element = document.createElement('div');
  element.setAttribute('data-test', '1');

  observer.observe(element, attributeOldValue: true);
  element.setAttribute('data-test', '1');
  var records = observer.takeRecords();
  shouldBe(records.length, 1);
  shouldBeEqualToString(records[0].oldValue, '1');
  observer.disconnect();

  observer.observe(element, attributeOldValue: false);
  element.setAttribute('data-test', '1');
  records = observer.takeRecords();
  shouldBe(records.length, 1);
  shouldBeNull(records[0].oldValue);
  observer.disconnect();

  observer.observe(element, attributeFilter: ['data-test']);
  element.setAttribute('data-test', '2');
  records = observer.takeRecords();
  shouldBe(records.length, 1);
  shouldBeNull(records[0].oldValue);
  observer.disconnect();
}

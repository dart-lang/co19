/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test MutationObserver.observe options related to character data
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var observer = new MutationObserver((m,o) {});
  var text = new Text('0');

  observer.observe(text, characterDataOldValue: true);
  text.data = '1';
  var records = observer.takeRecords();
  shouldBe(records.length, 1);
  shouldBeEqualToString(records[0].oldValue, '0');
  observer.disconnect();

  observer.observe(text, characterDataOldValue: false);
  text.data = '2';
  records = observer.takeRecords();
  shouldBe(records.length, 1);
  shouldBeNull(records[0].oldValue);
  observer.disconnect();
}

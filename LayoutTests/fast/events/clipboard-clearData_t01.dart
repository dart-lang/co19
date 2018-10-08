/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests clipboard.clearData()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var testDataTransfer;
  copy(event)
  {
    event.preventDefault();

    testDataTransfer = event.clipboardData;
    testDataTransfer.setData('text', 'sample');
    testDataTransfer.setData('url', 'http://www.google.com/');
    testDataTransfer.setData('text/html', '<em>Markup</em>');
    testDataTransfer.setData('custom-data', 'hello world');

    //shouldNotThrow(() => testDataTransfer.clearData(null)); // Gets converted to "null" string.
    shouldBeEqualToString(testDataTransfer.getData("text"), 'sample');
    shouldBeEqualToString(testDataTransfer.getData("url"), 'http://www.google.com/');
    shouldBeEqualToString(testDataTransfer.getData("text/html"), '<em>Markup</em>');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), 'hello world');

    shouldNotThrow(() => testDataTransfer.clearData("custom-data"));
    shouldBeEqualToString(testDataTransfer.getData("text"), 'sample');
    shouldBeEqualToString(testDataTransfer.getData("url"), 'http://www.google.com/');
    shouldBeEqualToString(testDataTransfer.getData("text/html"), '<em>Markup</em>');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), '');

    shouldNotThrow(() => testDataTransfer.clearData());
    shouldBeEqualToString(testDataTransfer.getData("text"), '');
    shouldBeEqualToString(testDataTransfer.getData("url"), '');
    shouldBeEqualToString(testDataTransfer.getData("text/html"), '');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), '');
    asyncEnd();
  }

  document.body.onCopy.listen(copy);

  asyncStart();
  document.execCommand('copy', false, '');
}

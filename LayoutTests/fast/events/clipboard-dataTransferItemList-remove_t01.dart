/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that DataTransferItemList.remove() is working
 */
import "dart:html";
import "dart:convert";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      ''', treeSanitizer: new NullTreeSanitizer());

  _shouldThrow(func()) =>
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.INVALID_STATE);

  var dataTansferItemList;
  copy(event)
  {
    debug("* copy event");
    event.preventDefault();
    dataTansferItemList = event.clipboardData.items;

    dataTansferItemList.add('a', 'text/plain');
    dataTansferItemList.add('http://www.google.com/', 'text/uri-list');
    dataTansferItemList.add('<em>Markup</em>', 'text/html');
    dataTansferItemList.add('hello world', 'custom-data');

    shouldBe(dataTansferItemList.length, 4);
    shouldBeEqualToString(dataTansferItemList[0].type, 'text/plain');
    shouldBeEqualToString(dataTansferItemList[1].type, 'text/uri-list');
    shouldBeEqualToString(dataTansferItemList[2].type, 'text/html');
    shouldBeEqualToString(dataTansferItemList[3].type, 'custom-data');

    // Failure cases.
    shouldThrow(() => dataTansferItemList.remove());
    //shouldNotThrow(() => dataTansferItemList.remove(-1));
    shouldBe(dataTansferItemList.length, 4);
    shouldNotThrow(() => dataTansferItemList.remove(999));
    shouldBe(dataTansferItemList.length, 4);

    // Success cases.
    shouldNotThrow(() => dataTansferItemList.remove(0));
    shouldBe(dataTansferItemList.length, 3);
    shouldBeEqualToString(dataTansferItemList[0].type, 'text/uri-list');
    shouldBeEqualToString(dataTansferItemList[1].type, 'text/html');
    //shouldNotThrow(() => dataTansferItemList.remove(-4294967295)); // Wraps to 1.
    shouldNotThrow(() => dataTansferItemList.remove(1));
    shouldBe(dataTansferItemList.length, 2);
    shouldBeEqualToString(dataTansferItemList[1].type, 'custom-data');
  }

  paste(event)
  {
    debug("* paste event");
    dataTansferItemList = event.clipboardData.items;
    shouldBe(dataTansferItemList.length, 2);
    _shouldThrow(() => dataTansferItemList.remove(0)); // List is readonly during paste.
    shouldBe(dataTansferItemList.length, 2);
  }

  document.onCopy.listen(copy);
  document.onPaste.listen(paste);
  document.execCommand('copy', false, '');
  document.execCommand('paste', false, '');
}

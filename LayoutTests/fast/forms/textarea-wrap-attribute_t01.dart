/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLTextAreaElement.wrap reflects the wrap="" attribute. It is
 * not "limited to only known values", and it is a DOMString attribute which
 * means it just returns the content attributes's value directly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var textArea = document.createElement('textarea');
  document.body.append(textArea);

  debug('If wrap attribute is not specified it sould be empty String.');
  shouldBe(textArea.wrap, "");

  debug('');
  debug('Check if it sets warpAttr value hard, should return hard.');
  textArea.wrap = "hard";
  shouldBe(textArea.wrap, "hard");

  debug('');
  debug('Check if it sets warpAttr value as soft, should return soft.');
  textArea.wrap = "soft";
  shouldBe(textArea.wrap, "soft");

  debug('');
  debug('Check if warpAttr present but no keyVal specified, should return empty String.');
  textArea.wrap = "";
  shouldBe(textArea.wrap, "");

  debug('');
  debug('Check if it sets warpAttr invaild value, should return foo.');
  textArea.wrap = "foo";
  shouldBe(textArea.wrap, "foo");
}

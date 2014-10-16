/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for .text for OPTION element
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  // See http://www.whatwg.org/specs/web-apps/current-work/multipage/common-microsyntaxes.html#space-character
  var HTMLSpaces = [
    new String.fromCharCode(0x20),
    new String.fromCharCode(0x09),
    new String.fromCharCode(0x0A),
    new String.fromCharCode(0x0C),
    new String.fromCharCode(0x0D)
  ];

  // Unicode white spaces which are not handled as white space
  // when removing spaces on option element.
  // These are taken from Unicode PropList.txt
  var nonHTMLSpaces = [
    new String.fromCharCode(0x0B),
    new String.fromCharCode(0x85),
    new String.fromCharCode(0xA0),
    new String.fromCharCode(0x1680),
    new String.fromCharCode(0x180E),
    new String.fromCharCode(0x2000),
    new String.fromCharCode(0x2001),
    new String.fromCharCode(0x2002),
    new String.fromCharCode(0x2003),
    new String.fromCharCode(0x2004),
    new String.fromCharCode(0x2005),
    new String.fromCharCode(0x2006),
    new String.fromCharCode(0x2007),
    new String.fromCharCode(0x2008),
    new String.fromCharCode(0x2009),
    new String.fromCharCode(0x200A),
    new String.fromCharCode(0x2028),
    new String.fromCharCode(0x2029),
    new String.fromCharCode(0x202F),
    new String.fromCharCode(0x205F),
    new String.fromCharCode(0x3000)
  ];

  var parent = document.createElement('div');
  document.body.append(parent);
  parent.setInnerHtml('<select><option id=option></option></select>',
      treeSanitizer: new NullTreeSanitizer());

  var option = document.getElementById('option');

  var expected;

  debug('Insert one HTMLspace before/after/between the text');
  for (var i = 0; i < HTMLSpaces.length; ++i) {
    option.text = HTMLSpaces[i] + 'text' + HTMLSpaces[i] + 'text' + HTMLSpaces[i];
    expected = 'text text';
    shouldBe(option.text, expected);
  }
  debug('');

  debug('Insert multiple HTMLspaces before/after/between the text');
  for (var i = 0; i < HTMLSpaces.length; ++i) {
    for (var j = 0; j < HTMLSpaces.length; ++j) {
      option.text = HTMLSpaces[i] + HTMLSpaces[j] + 'text' + HTMLSpaces[i] + HTMLSpaces[j] + 'text' + HTMLSpaces[i] + HTMLSpaces[j];
      expected = 'text text';
      shouldBe(option.text, expected);
    }
  }
  debug('');

  debug('');

  debug('Insert one nonHTMLspace before/after/between the text');
  for (var i = 0; i < nonHTMLSpaces.length; ++i) {
    option.text = nonHTMLSpaces[i] + 'text' + nonHTMLSpaces[i] + 'text' + nonHTMLSpaces[i];
    expected = nonHTMLSpaces[i] + 'text' + nonHTMLSpaces[i] + 'text' + nonHTMLSpaces[i];
    shouldBe(option.text, expected);
  }
  debug('');

  debug('Insert multiple nonHTMLspaces before/after/between the text');
  for (var i = 0; i < nonHTMLSpaces.length; ++i) {
    for (var j = 0; j < nonHTMLSpaces.length; ++j) {
      option.text = nonHTMLSpaces[i] + nonHTMLSpaces[j] + 'text' + nonHTMLSpaces[i] + nonHTMLSpaces[j] + 'text' + nonHTMLSpaces[i] + nonHTMLSpaces[j];
      expected = nonHTMLSpaces[i] + nonHTMLSpaces[j] + 'text' + nonHTMLSpaces[i] + nonHTMLSpaces[j] + 'text' + nonHTMLSpaces[i] + nonHTMLSpaces[j];
      shouldBe(option.text, expected);
    }
  }
}

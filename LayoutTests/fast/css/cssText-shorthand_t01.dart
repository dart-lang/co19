/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebKit uses shorthand notations for cssText
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  if (document.createElement('div').style.supportsProperty('-webkit-border-horizontal-spacing')) {
    var tests = [
      // FIXME: This exhibits a bug. We shouldn't be outputing border-image here.
      ['border: 1px; border-top: 1px;', 'border: 1px;'],
      ['border: 1px solid red;', 'border: 1px solid red;'],
      ['border: 1px red;', 'border: 1px red;'],
      ['border: red;', 'border: red;'],
      [
        'border-top: 1px; border-right: 1px; border-bottom: 1px; border-left: 1px;',
        'border: 1px;'
      ],
      [
        'border-top: 1px; border-right: 2px; border-bottom: 3px; border-left: 4px;',
        'border-color: initial; border-style: initial; border-width: 1px 2px 3px 4px;'
      ],
      ['border: 1px; border-top: 2px;', 'border-color: initial; border-style: initial; border-width: 2px 1px 1px;'],
      ['border: 1px; border-top: 1px !important;',
      'border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-width: 1px !important;'
      ],

      [
        'border: 1px; border-top-color: red;',
        'border-style: initial; border-width: 1px; border-top-color: red;'
      ],
      ['border: solid; border-style: dotted', 'border: dotted;'],
      ['border-width: 1px;', 'border-width: 1px;'],

      [
        '-webkit-border-horizontal-spacing: 1px; -webkit-border-vertical-spacing: 2px;',
        'border-spacing: 1px 2px;'
      ],

      // We don't use shorthand for font-family, etc... for compatibility reasons
      [
        'font-family: sans-serif; line-height: 2em; font-size: 3em; font-style: italic; font-weight: bold;',
        'font-family: sans-serif; line-height: 2em; font-size: 3em; font-style: italic; font-weight: bold;'
      ],

      [
        'list-style-type: circle; list-style-position: inside; list-style-image: initial;',
        'list-style: circle inside;'
      ],
      [
        'margin-top: 1px; margin-right: 2px; margin-bottom: 3px; margin-left: 4px;',
        'margin: 1px 2px 3px 4px;'
      ],
      [
        'outline-width: 2px; outline-style: dotted; outline-color: blue;',
        'outline: blue dotted 2px;'
      ],
      //['overflow-x: scroll; overflow-y: hidden;', 'overflow: scroll hidden;'],
      ['overflow-x: scroll; overflow-y: scroll;', 'overflow: scroll;'],
      [
        'padding-top: 1px; padding-right: 2px; padding-bottom: 3px; padding-left: 4px;',
        'padding: 1px 2px 3px 4px;'
      ],

      ['list-style-type: lower-alpha;', 'list-style-type: lower-alpha;']
    ];

    normalizeCssText(text) {
      return (text.trim().split(new RegExp(r';\s*'))
        ..sort()).sublist(1).join("; ");
    }

    var element;
    tests.forEach((test) {
      var styleAttribute = test[0];
      var expectedCssText = test[1];

      element = document.createElement('div');
      element.setAttribute('style', styleAttribute);

      shouldBe(normalizeCssText(element.style.cssText),
          normalizeCssText(expectedCssText));
    });
  }
}

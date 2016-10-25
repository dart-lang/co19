/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that computed style is not affected by the zoom value
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  testPropertyValue(prop, value)
  {
    var el = document.createElement('div');
    el.style.cssText = 'position: absolute; width: 100px; height: 100px;' +
      'overflow: hidden; border: 20px solid red;' +
      'outline: 20px solid blue;-webkit-column-rule: 20px solid red';
    el.style.setProperty(prop, value, '');

    document.body.style.zoom = '';
    document.body.append(el);

    var value1 = getComputedStyle(el, null).getPropertyValue(prop);
    document.body.style.zoom = '2';
    var value2 = getComputedStyle(el, null).getPropertyValue(prop);
    document.body.style.zoom = '.5';
    var value3 = getComputedStyle(el, null).getPropertyValue(prop);

    el.remove();
    document.body.style.zoom = '';

    debug('test1, $prop $value');
    shouldBe(value1, value2);
    debug('test2, $prop $value');
    shouldBe(value2, value3);
  }

  testProperty(data)
  {
    var prop = data[0];
    if (data.length == 1)
      data.add('20px');

    for (var i = 1; i < data.length; i++) {
      testPropertyValue(prop, data[i]);
    }
  }

  var testData = [
    ['-webkit-border-horizontal-spacing'],
    ['-webkit-border-vertical-spacing'],
    ['-webkit-box-reflect', 'below 20px -webkit-gradient(linear, left top, left bottom, from(transparent), to(white))'],
    ['-webkit-box-shadow', '20px 20px 20px 20px red'],
    ['-webkit-column-rule-width', '20px'],
    ['-webkit-mask-box-image-outset'],
    ['-webkit-mask-box-image-width'],
    ['-webkit-perspective-origin', '20px 20px'],
    ['-webkit-text-stroke-width'],
    ['-webkit-transform', 'translate(20px, 20px)', 'translate3d(20px, 20px, 20px)'],
    ['-webkit-transform-origin', '20px 20px', '-20px -20px'],
    ['border-bottom-left-radius'],
    ['border-bottom-right-radius'],
    ['border-bottom-width'],
    ['border-image-outset'],
    ['border-image-width'],
    ['border-left-width'],
    ['border-right-width'],
    ['border-spacing'],
    ['border-top-left-radius'],
    ['border-top-right-radius'],
    ['border-top-width'],
    ['bottom', '20px', '-20px'],
    ['clip', 'rect(20px 80px 80px 20px)'],
    ['font-size', '20px', 'large'],
    ['height'],
    ['left', '20px', '-20px'],
    ['letter-spacing', '20px', '-20px'],
    ['line-height'],
    ['margin-bottom', '20px', '-20px'],
    ['margin-left', '20px', '-20px'],
    ['margin-right', '20px', '-20px'],
    ['margin-top', '20px', '-20px'],
    ['outline-width'],
    ['padding-bottom'],
    ['padding-left'],
    ['padding-right'],
    ['padding-top'],
    ['right', '20px', '-20px'],
    ['text-shadow', '20px 20px 20px red'],
    ['top', '20px', '-20px'],
    ['width'],
    ['word-spacing', '20px', '-20px'],
    ];

  testData.forEach(testProperty);
}

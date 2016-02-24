/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure that shadow element cannot be created in 
 * elements having dynamically created shadow root.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  testToAddShadowRoot(element, success) {
    debug(element.nodeName);

    if (success)
      shouldNotBe(element.createShadowRoot(), null);
    else
      shouldThrow(() => element.createShadowRoot());
  }

  var elementsToSuccess = [
    document.createElement('div'),
    document.createElement('span'),
    document.createElement('a'),
    document.createElement('section'),
    document.createElement('input'),
    document.createElement('applet'),
    document.createElement('embed'),
    document.createElement('object'),
    ];

  // See crbug.com/234020 .
  var elementsToFail = [
    document.createElement('audio'),
    document.createElement('video'),
    document.createElement('select'),
    document.createElement('img'),
    document.createElement('textarea'),
    document.createElement('iframe'),
    document.createElement('canvas'),
    document.createElement('meter'),
    document.createElement('progress'),
    document.createElement('keygen'),
    document.createElement('video'),
    document.createElement('audio'),
    document.createElement('fieldset'),
    ];

  for (var i = 0; i < elementsToSuccess.length; ++i) {
    var element = elementsToSuccess[i];
    testToAddShadowRoot(element, true);
  }

  for (var i = 0; i < elementsToFail.length; ++i) {
    var element = elementsToFail[i];
    testToAddShadowRoot(element, false);
  }
}

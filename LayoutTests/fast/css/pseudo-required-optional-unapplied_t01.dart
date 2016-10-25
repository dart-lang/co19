/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check cases that :required/:optional classes are not applied
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      :required {
          background-color: red;
      }
      :optional {
          background-color: red;
      }
      input, fieldset, legend, label, datalist, optgroup, option, keygen, output, meter, progress {
          background-color: lime;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>

      <div id=victims>
      <fieldset id=fieldset>
      <legend id=legend></legend>
      </fieldset>
      <label id=label></label>
      <datalist id=datalist></datalist>
      <select>
      <optgroup id=optgroup></optgroup>
      <option id=option></option>
      </select>
      <keygen id=keygen>
      <output id=output></output>
      <meter id=meter></meter>
      <progress id=progress></progress>
      </div>

      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  getBackgroundColor(id) {
    var element = document.getElementById(id);
    return getComputedStyle(element, null).getPropertyValue('background-color');
  }

  var identifiers = [
    'fieldset',
    'legend',
    'label',
    'datalist',
    'optgroup',
    'option',
    'keygen',
    'output',
    'meter',
    'progress',
  ];

  var normalColor = 'rgb(0, 255, 0)';
  for (var i = 0; i < identifiers.length; i++)
    shouldBe(getBackgroundColor(identifiers[i]), normalColor);

  document.getElementById('victims').innerHtml = '';
}

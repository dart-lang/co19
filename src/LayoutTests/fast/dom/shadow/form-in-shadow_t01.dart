/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  createShadowForm() {
    var container = document.getElementById('container');
    var shadowRoot = container.createShadowRoot();

    shadowRoot.innerHtml =
      '<form>' +
      '    <input type="hidden" name="hidden" value="hidden">' +
      '    <input type="text" name="text" value="text">' +
      '    <input type="checkbox" name="checkbox1" checked>' +
      '    <input type="checkbox" name="checkbox2">' +
      '    <input type="range" name="range" min="0" max="100" value="50">' +
      '    <textarea name="textarea">textarea</textarea>' +
      '    <input id="submit" type="submit">' +
      '</form>';

    return shadowRoot.getElementById('submit');
  }

  parseQuery(query) {
    var result = {};
    var nameValues = query.split('&');

    for (var i = 0; i < nameValues.length; ++i) {
      var idx = nameValues[i].indexOf('=');
      var name = nameValues[i].substring(0, idx);
      var value = nameValues[i].substring(idx + 1);

      result[name] = value;
    }

    return result;
  }

  var obj;
  checkQuery(query) {
    obj = parseQuery(query);

    shouldBe(obj['hidden'], 'hidden');
    shouldBe(obj['text'], 'text');
    shouldBe(obj['checkbox1'], 'on');
    shouldBeNull(obj['checkbox2']);
    shouldBe(obj['range'], '50');
    shouldBe(obj['textarea'], 'textarea');
  }

  var submitButton = createShadowForm();
  var loc = window.location;

  if (loc.href.indexOf('checkbox') > 0) {
    var query = loc.href.substring(loc.href.indexOf('?') + 1);
    checkQuery(query);
  } else {
    submitButton.click();
  }
}

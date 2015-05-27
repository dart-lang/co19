/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Selectors and Shadow Scopes
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          input[type=range] {
              -webkit-appearance: none;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Tests whether and how selectors cross shadow DOM scopes.</p>
      <input id="foo" class="bar" style="height:auto" type="range">
      <div id="log"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var head;
  var input;
  var logDiv;
  var SELECTOR_TEST_PROPERTIES = ' { height: 1px; -webkit-appearance: none; }';

  // convenience constants
  var MATCH = true;
  var NO_MATCH = false;

  log(msg, success)
  {
    logDiv.append(document.createElement('div')).innerHtml = msg + ': ' + (success ? 'PASS' : 'FAIL');
    shouldBeTrue(success);
  }

  runSelectorTest(matchExpected, selector)
  {
    debug(selector);
    var style = document.createElement('style');
    style.text = selector + SELECTOR_TEST_PROPERTIES;
    head.append(style);
    var matched = input.offsetHeight == 1;
    log('<code>' + selector + '</code> <strong>should' + (matchExpected ? '' : ' not') + '</strong> match', matchExpected ? matched : !matched);
    style.remove();
  }

  runTest()
  {
    head = document.getElementsByTagName('head')[0];
    input = document.getElementsByTagName('input')[0];
    logDiv = document.getElementById('log');
    runSelectorTest(NO_MATCH, 'div');
    runSelectorTest(NO_MATCH, '*');
    runSelectorTest(NO_MATCH, 'body *');
    input.remove();
  }

  runTest();
}

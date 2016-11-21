/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for selectionDirection
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div><input id="dummy"></div>
      <div id="tests"><input value="hello"><textarea>hello</textarea></div>
      <div id="console"></div>
      <div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var dummy = document.getElementById('dummy');

  assertDirection(expectedDirection, element, description) {
    var action = 'selectionDirection was "' + element.selectionDirection
      + '" after ' + description;

    if (element.selectionDirection == expectedDirection)
      testPassed(action);
    else
      testFailed(action + ', but expected "' + expectedDirection + '"');
  }

  testCache(expectedDirection, element) {
    dummy.focus();
    assertDirection(expectedDirection, element, 'focusing on another element');

    element.style.display = 'none';
    assertDirection(expectedDirection, element, 'hiding the element');
    element.style.display = null;
  }

  runTest(element, platform) {
    debug(element.localName + ' on ' + platform);
    element.focus();

    var noneOnMacAndForwardOnOthers = (platform == 'Mac') ? 'none' : 'forward';

    element.setSelectionRange(1, 2);
    assertDirection(noneOnMacAndForwardOnOthers, element, 'focusing and setting selection by setSelectionRange(1, 2)');
    testCache(noneOnMacAndForwardOnOthers, element);

    element.focus();
    element.setSelectionRange(1, 2, 'forward');
    assertDirection('forward', element, 'focusing and setting selection by setSelectionRange(1, 2, "forward")');
    testCache('forward', element);

    element.setSelectionRange(1, 2, 'backward');
    assertDirection('backward', element, 'setting selection by setSelectionRange(1, 2, "backward") without focus');
    testCache('backward', element);

    element.selectionDirection = 'none';
    assertDirection(noneOnMacAndForwardOnOthers, element, 'setting selection by selectionDirection = "none" without focus');
    testCache(noneOnMacAndForwardOnOthers, element);

    element.selectionDirection = 'forward';
    assertDirection('forward', element, 'focusing and setting selection by selectionDirection = "forward" without focus');
    testCache('forward', element);

    element.focus();
    element.selectionDirection = 'backward';
    assertDirection('backward', element, 'focusing and setting selection by selectionDirection = "backward"');
    testCache('backward', element);

    element.focus();
    element.setSelectionRange(1, 1);
    window.getSelection().modify('extend', 'forward', 'character');
    assertDirection('forward', element, 'extending selection forward by character');
    testCache('forward', element);

    element.focus();
    element.setSelectionRange(1, 1);
    window.getSelection().modify('extend', 'backward', 'character');
    assertDirection('backward', element, 'extending selection backward by character');
    testCache('backward', element);

  }

  runTestFor(platform) {
    var tests = document.getElementById('tests');
    for (var i = 0; i < tests.childNodes.length; i++) {
      runTest(tests.childNodes[i], platform);
      debug('');
    }
  }

  runTestFor(window.navigator.platform.indexOf('Mac') >= 0 ? 'Mac' : 'Win');

  var tests = document.getElementById('tests');
  tests.style.display = 'none';
  (dummy.parentNode as Element).style.display = 'none';
}

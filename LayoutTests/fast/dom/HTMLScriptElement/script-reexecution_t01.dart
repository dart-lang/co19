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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <p>Created script element, script data passed as text content, appended: <span id="p1">FAIL</span></p>
    <p>Removed element, readd element, remove again, script shouldn't have executed:<span id="p2">PASS</span></p>
    <p>Created script element, loading external script content, appended: <span id="p3">FAIL</span></p>
    <p>Removed element, readd element, script shouldn't have executed: <span id="p4">PASS</span></p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var pass = '''
  function pass() {
    var contentElement = document.getElementById(test);

    if (contentElement.textContent == 'PASS') {
      contentElement.textContent = 'FAIL';
    } else if (contentElement.textContent == 'FAIL') {
      contentElement.textContent = 'PASS';
    }
  };''';

  jsExec(text) {
    var s = new ScriptElement();
    s.text = text;
    document.head.append(s);
    s.remove();
  }

  jsExec('test = "p1";');

  var e1 = document.createElement("script");
  e1.text = pass + " pass();";
  document.getElementsByTagName("head")[0].append(e1);
  e1.remove();

  jsExec('test = "p2";');

  document.getElementsByTagName("head")[0].append(e1);
  e1.remove();

  jsExec('test = "p3"');

  var e3;

  finish() {
    jsExec('test = "p4";');
    e3.remove();
    document.getElementsByTagName("head")[0].append(e3);
    asyncEnd();
  }

  e3 = document.createElement("script");
  e3.src = "$root/resources/script-reexecution-pass.js";
  e3.onLoad.first.then((_) => finish());
  asyncStart();
  document.getElementsByTagName("head")[0].append(e3);
}

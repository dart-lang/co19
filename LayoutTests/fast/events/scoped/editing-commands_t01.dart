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
      <p>This test ensures WebKit does not fire DOM mutation events while execCommand is in progress.</p>
      <div id="test" contenteditable></div>
      <pre></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var commands = [
  {'name': 'BackColor', 'value': 'blue'},
  {'name': 'CreateLink', 'value': 'about:blank'},
  {'name': 'Delete', 'value': null},
  {'name': 'FontName', 'value': 'Arial'},
  {'name': 'FontSize', 'value': '5'},
  {'name': 'FontSizeDelta', 'value': '5'},
  {'name': 'ForeColor', 'value': 'blue'},
  {'name': 'FormatBlock', 'value': 'pre'},
  {'name': 'ForwardDelete', 'value': null},
  {'name': 'HiliteColor', 'value': 'red'},
  {'name': 'Indent', 'value': null},
  {'name': 'InsertHTML', 'value': "<i>hello</i>"},
  {'name': 'InsertHorizontalRule', 'value': null},
  {'name': 'InsertImage', 'value': '$root/../resources/abe.png'},
  {'name': 'InsertLineBreak', 'value': null},
  {'name': 'InsertNewlineInQuotedContent', 'value': null},
  {'name': 'InsertOrderedList', 'value': null},
  {'name': 'InsertParagraph', 'value': null},
  {'name': 'InsertText', 'value': 'webkit'},
  {'name': 'InsertUnorderedList', 'value': null},
  {'name': 'Italic', 'value': null},
  {'name': 'JustifyCenter', 'value': null},
  {'name': 'JustifyFull', 'value': null},
  {'name': 'JustifyLeft', 'value': null},
  {'name': 'JustifyNone', 'value': null},
  {'name': 'JustifyRight', 'value': null},
  {'name': 'Outdent', 'value': null},
  {'name': 'RemoveFormat', 'value': null},
  {'name': 'Strikethrough', 'value': null},
  {'name': 'Subscript', 'value': null},
  {'name': 'Superscript', 'value': null},
  {'name': 'Transpose', 'value': null, 'selector': (test) { window.getSelection().setPosition(test.firstChild, 1); }},
  {'name': 'Underline', 'value': null},
  {'name': 'Unlink', 'value': null},
  ];

  var events = {
    'DOMCharacterDataModified': false,
    'DOMSubtreeModified': false,
    'DOMNodeInserted': false,
    'DOMNodeRemoved': false,
    'DOMNodeRemovedFromDocument': false,
    'DOMNodeInsertedIntoDocument': true, // this event can never be observed.
    'DOMFocusIn': false,
    'DOMFocusOut': false,
    'focusin': false,
    'focusout': false,
  };

  var log = [];
  var test = document.getElementById('test');

  addEventListeners(node) {
    for (var e in events.keys) {
      node.addEventListener(e, (event) {
        log.add(test.innerHtml);
        events[event.type] = true;
      }, false);
    }
  }

  isLogConsistent() {
    for (var i= 1; i < log.length; i++) {
      if (log[0] != log[i]) {
        window.console.log(log);
        return false;
      }
    }
    return true;
  }

  addEventListeners(test);

  var initial = 'hello, <input type="text"><blockquote align="right"><u><a href="about:blank">world</a></u></blockquote>';
  for (var command in commands) {
    test.setInnerHtml(initial, treeSanitizer: new NullTreeSanitizer());

    debug('initial innerHtml');
    shouldBe(test.innerHtml, initial);

    if (command['selector'] != null) {
      Function f = command['selector'];
      f(test);
    } else {
      InputElement input = document.body.querySelector('input');
      input.focus();
      window.getSelection().selectAllChildren(test);
    }
    addEventListeners(test.childNodes[2]);
    log = []; // clear log
    document.execCommand(command['name'], false, command['value']);

    var action = "execCommand('${command['name']}', false, '${command['value']}')";

    if (test.innerHtml == initial || log.length <= 0)
      testFailed('FAIL: ' + action + ' made no change to the DOM.');
    else if (!isLogConsistent())
      testFailed('FAIL: ' + action + ' dispatched events before finalizing the DOM tree.');
    else
      testPassed('PASS: ' + action);
  }
  test.style.display = 'none';

  for (var e in events.keys) {
    if (!events[e])
      testFailed('FAIL: ' + e + ' was never observed.');
  }
}

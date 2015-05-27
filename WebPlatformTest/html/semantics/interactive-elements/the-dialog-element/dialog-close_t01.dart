/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/interactive-elements/the-dialog-element/dialog-close.html * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#the-dialog-element
 * @description dialog element: close()
 * @note api bug #19638:: document.getElementById('d1') returns UnknownElement instead of DialogElement
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<dialog id="d1">
  <p>foobar</p>
  <button>OK</button>
</dialog>
<dialog id="d2" open>
  <p>foobar</p>
  <button>OK</button>
</dialog>
<dialog id="d3" open>
  <p>foobar</p>
  <button>OK</button>
</dialog>
<dialog id="d4" open>
  <p>foobar</p>
  <button>OK</button>
</dialog>
<dialog id="d5" open>
  <p>foobar</p>
  <button>OK</button>
</dialog>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var d1 = document.getElementById('d1'),
      d2 = document.getElementById('d2'),
      d3 = document.getElementById('d3'),
      d4 = document.getElementById('d4'),
      d5 = document.getElementById('d5'),
      was_queued = false;
print("d1 is ${d1.runtimeType}");
  test((){
    assert_throws("InvalidStateError", () {
      d1.close();
    });
  }, "close() on a <dialog> that doesn't have an open attribute throws an InvalidStateError exception");
  
  test((){
    assert_true(d2.open);
    assert_equals(d2.returnValue, "");
    d2.close("closedialog");
    assert_false(d2.hasAttribute("open"));
    assert_equals(d2.returnValue, "closedialog");
  }, "close() removes the open attribute and set the returnValue to the first argument");

  test((){
    assert_true(d3.open);
    assert_equals(d3.returnValue, "");
    d3.returnValue = "foobar";
    d3.close();
    assert_false(d3.hasAttribute("open"));
    assert_equals(d3.returnValue, "foobar");
  }, "close() without argument removes the open attribute and there's no returnValue");

/*
  asyncStart();
  d4.on["toggle"].listen((evt) {
    asyncEnd();
    test((){
      assert_true(was_queued, "close event should be queued");
      assert_true(e.isTrusted, "close event is trusted");
      assert_false(e.bubbles, "close event doesn't bubble");
      assert_false(e.cancelable, "close event is not cancelable");
    }, "test close()");
  });
  d4.close();

  checkAsyncTestFailures();
*/

  checkTestFailures();
}

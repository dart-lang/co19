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
 * after web-platform-tests/html/semantics/interactive-elements/the-details-element/toggleEvent.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#the-details-element
 * @description The details element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<details id=details1>
  <summary>Lorem ipsum</summary>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
</details>
<details id=details2 open>
  <summary>Lorem ipsum</summary>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
</details>
<details id=details3 style="display:none;">
  <summary>Lorem ipsum</summary>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
</details>
<details id=details4>
</details>
<details id=details6>
  <summary>Lorem ipsum</summary>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
</details>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  void testEvent(evt) {
//    assert_true(evt.isTrusted, "event is trusted");
    assert_false(evt.bubbles, "event doesn't bubble");
    assert_false(evt.cancelable, "event is not cancelable");
  }

  var details1 = document.getElementById('details1');
  asyncStart();
  details1.on["toggle"].listen((evt) {
    test((){
      assert_true(details1.open);
      testEvent(evt);
    }, "Adding open to 'details' should fire a toggle event at the 'details' element");
    asyncEnd();
  }); 
  details1.open = true; // opens details1
  
  var details2 = document.getElementById('details2');
  asyncStart();
  details1.on["toggle"].listen((evt) {
    test((){
      assert_false(details2.open);
      testEvent(evt);
    }, "Removing open from 'details' should fire a toggle event at the 'details' element");
    asyncEnd();
  }); 
  details2.open = false; // closes details2
  
  var details3 = document.getElementById('details3');
  asyncStart();
  details1.on["toggle"].listen((evt) {
    test((){
      assert_true(details3.open);
      testEvent(evt);
    }, "Adding open to 'details' (display:none) should fire a toggle event at the 'details' element");
    asyncEnd();
  }); 
  details3.open = true; // opens details3
  
  var details4 = document.getElementById('details4');
  asyncStart();
  details1.on["toggle"].listen((evt) {
    test((){
      assert_true(details4.open);
      testEvent(evt);
    }, "Adding open to 'details' (display:none) should fire a toggle event at the 'details' element");
    asyncEnd();
  }); 
  details4.open = true; // opens details4

  checkAsyncTestFailures();
}

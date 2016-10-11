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
/*
 * after web-platform-tests/DOMEvents/tests/approved/Event.bubbles.false.html
 *
 * @assertion Event.bubbles attribute is set to false 
 * @description If the Event.bubbles attribute is set to false,
 * the bubble phase shall be skipped.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String htmlEL='''
<table id="table" border="1">
    <tbody id="table-body">
    <tr id="table-row">
        <td id="table-cell">Shady Grove</td>
        <td>Aeolian</td>
    </tr>
    <tr id="parent">    
        <td id="target">Over the river, Charlie</td>
        <td>Dorian</td>
    </tr>
    </tbody>
</table>
''';
         
void main() {
    Element el = new Element.html(htmlEL);
    document.body.append(el);
    var EVENT = "click";    
    var TARGET = document.getElementById("target");
    var PARENT = document.getElementById("parent"); 
    var TBODY = document.getElementById("table-body");
    var TABLE = document.getElementById("table");
    var BODY = document.body;
    var HTML = document.documentElement;                
    var CurrentTargets = [window, document, HTML, BODY, TABLE, TBODY, PARENT, TARGET];
    var ExpectResult = new List.from(CurrentTargets);
    ExpectResult.add(TARGET);
    var ActualResult = [];
    var ExpectPhases = [1,1,1,1,1,1,1,2,2];
    var ActualPhases = [];
         
    TestEvent(evt)   {
        ActualResult.add(evt.currentTarget);         
        ActualPhases.add(evt.eventPhase);          
    }
    
    for (var i=0; i < CurrentTargets.length; i++)  {
       CurrentTargets[i].addEventListener(EVENT, TestEvent, true);
       CurrentTargets[i].addEventListener(EVENT, TestEvent, false);
    }
       
    Event evt = new Event(EVENT, canBubble:false, cancelable:true);
    TARGET.dispatchEvent(evt);

    assert_array_equals(ActualResult, ExpectResult, "ActualResult");
    assert_array_equals(ActualPhases, ExpectPhases, "ActualPhases");
}

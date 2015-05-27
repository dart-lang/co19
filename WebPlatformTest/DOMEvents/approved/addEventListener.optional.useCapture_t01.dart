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
 * after web-platform-tests/DOMEvents/tests/approved/addEventListener.optional.useCapture.html
 *
 * @assertion addEventListener() optional parameter: useCapture
 * @description useCapture is an optional parameter for EventTarget.addEventListener and EventTarget.removeEventListener. 
 * If it is not provided, both methods must behave as if useCapture were specified to be false. 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String tableStr="""
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
""";
         
void main() {
   Element table = new Element.html(tableStr);
   document.body.append(table);
   var EVENT = "foo";    
   var TARGET = document.getElementById("target");
   var PARENT = document.getElementById("parent"); 
   var TBODY = document.getElementById("table-body");
   var TABLE = document.getElementById("table");
   var BODY = document.body;
   var HTML = document.documentElement;                
   var CurrentTargets = [TARGET, PARENT, TBODY, TABLE, BODY, HTML, document, window];
   var ExpectResult = CurrentTargets;
   var ActualResult = [];
   var ExpectPhases = [2,3,3,3,3,3,3,3];
   var ActualPhases = [];
   
   void TestEvent(evt, i)  {
print ("TestEvent: evt=$evt");
       ActualResult.add(evt.currentTarget);         
       ActualPhases.add(evt.eventPhase);
   }
    
   var EventHandlers = [ (evt){ TestEvent(evt, 0); }, (evt){ TestEvent(evt, 1); } ];


   for (var i=0; i < CurrentTargets.length; i++)  {
      var currentTarget = CurrentTargets[i];
      for (var j=0; i < EventHandlers.length; i++)  {    
         currentTarget.addEventListener(EVENT, EventHandlers[j]);
      }
   }
   Event evt = new Event(EVENT, canBubble:true, cancelable:true);
      
   TARGET.dispatchEvent(evt);
       
   for (var i=0; i < CurrentTargets.length; i++) {
      var currentTarget = CurrentTargets[i];
      for (var j=0; i < EventHandlers.length; i++)  {    
         currentTarget.removeEventListener(EVENT, EventHandlers[j]);
      }
   }

   TARGET.dispatchEvent(evt);

   assert_array_equals(ActualResult, ExpectResult, "ActualResult");
   assert_array_equals(ActualPhases, ExpectPhases, "ActualPhases");        
}

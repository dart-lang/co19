/*
 * after web-platform-tests/DOMEvents/tests/approved/stopPropagation.dispatchEvent.html
 *
 * @assertion Calling stopPropagation() prior to dispatchEvent()
 * @description If Event.stopPropagation() has been called prior to the dispatch,
 * all phases must be skipped.
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

    var EVENT = "foo";    
    var TARGET = document.getElementById("target");
    var PARENT = document.getElementById("parent"); 
    var TBODY = document.getElementById("table-body");
    var TABLE = document.getElementById("table");
    var BODY = document.body;
    var HTML = document.documentElement;                
    var CurrentTargets = [window, document, HTML, BODY, TABLE, TBODY, PARENT, TARGET];
    var ActualResult = [];
    var ActualPhases = [];

    void TestEvent(evt) {   
        ActualResult.add(evt.currentTarget);         
        ActualPhases.add(evt.eventPhase);                   
    }

    for (var i=0; i < CurrentTargets.length; i++) {
        CurrentTargets[i].addEventListener(EVENT, TestEvent, true);
        CurrentTargets[i].addEventListener(EVENT, TestEvent, false);
    }
       
    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
    evt.stopPropagation();              
    TARGET.dispatchEvent(evt);

    Expect.equals(0, ActualResult.length, "ActualResult");
    Expect.equals(0, ActualPhases.length, "ActualPhases");
 }
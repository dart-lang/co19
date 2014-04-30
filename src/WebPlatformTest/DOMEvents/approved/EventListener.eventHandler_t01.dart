/*
 * after web-platform-tests/DOMEvents/tests/approved/EventListener.eventHandler.html
 *
 * @assertion EventLister member: handleEvent()  
 * @description This method shall be called whenever an event occurs of the event type for
 * which the EventListener interface was registered.    
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
    
    void eventHandler (evt) {
        assert_true ((EVENT == evt.type) && (TARGET == evt.target));
        asyncEnd();
    }

    Event evt = new Event(EVENT, canBubble:true, cancelable:true);

    asyncStart();
    
    TARGET.addEventListener(EVENT, eventHandler, true);
    TARGET.dispatchEvent(evt);
//    TARGET.removeEventListener(EVENT, eventHandler, true);
}
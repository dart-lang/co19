/*
 * after web-platform-tests/DOMEvents/tests/approved/dispatchEvent.return.value.html
 *
 * @assertion return value and Event.preventDefault()
 * @description dispatchEvent() return value indicates whether any of the listeners
 * which handled the event called "Event.preventDefault().
 * If Event.preventDefault() was called the returned value must be false,
 * else it must be true.
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
    var DefaultPrevented = false;
    
    void TestEvent(evt, i)   {
        if (1 == i)  {
            evt.preventDefault();
            DefaultPrevented = evt.defaultPrevented;
        }
    }

    PARENT.addEventListener(EVENT, (e){TestEvent(e, 0);}, true);
    TARGET.addEventListener(EVENT, (e){TestEvent(e, 1);}, true);
    TARGET.addEventListener(EVENT, (e){TestEvent(e, 2);}, true);
        
    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
        
    var ReturnValue1 = PARENT.dispatchEvent(evt);
    var ReturnValue2 = TARGET.dispatchEvent(evt);

    assert_array_equals([DefaultPrevented, ReturnValue1, ReturnValue2], [true, true, false]);
}
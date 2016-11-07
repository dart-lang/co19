/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.documentElement.id = "HTML";

  document.body.setInnerHtml('''
      <p>This tests the target, currentEvent, and phase of a complete trace through event bubbling and capture.</p>
      <pre id="console"></pre>

      <br>
      <div id="Parent" style="background-color:lightblue;border:1px solid #000000; padding: 10px; margin: 10px;">
        Parent
        <div id="Self" style="background-color:blue; border:1px solid black; padding: 10px; margin: 10px;">
          Self
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.id = "Body";

  log(msg) {
    document.getElementById('console').append(new Text(msg + "\n"));
  }

  traceEvent(event)
  {
    targetString(target)
    {
      if (target == null)
        return "No Target";
      if (target is Element)
        return target.runtimeType.toString() + " (ID: " + target.id + ")";
      return target.runtimeType.toString();
    }

    phaseString(eventPhase)
    {
      /*if (eventPhase == Event.NONE)
        return "NONE";
      else*/ if (eventPhase == Event.CAPTURING_PHASE)
        return "CAPTURE";
      else if (eventPhase == Event.BUBBLING_PHASE)
        return "BUBBLE";
      else if (eventPhase == Event.AT_TARGET)
        return "AT TARGET";
      else
        return "NONE";
    }

    var target = targetString(event.target);
    var currentTarget = targetString(event.currentTarget);
    var phase = phaseString(event.eventPhase);

    log("Target = " + target + "; Phase = " + phase + "; CurrentTarget = " + currentTarget + ";");
  }


  window.addEventListener("customevent", traceEvent, true);
  document.addEventListener("customevent", traceEvent, true);
  document.getElementById("HTML").addEventListener("customevent", traceEvent, true);
  document.getElementById("Body").addEventListener("customevent", traceEvent, true);
  document.getElementById("Parent").addEventListener("customevent", traceEvent, true);
  document.getElementById("Self").addEventListener("customevent", traceEvent, true);

  window.addEventListener("customevent", traceEvent, false);
  document.addEventListener("customevent", traceEvent, false);
  document.getElementById("HTML").addEventListener("customevent", traceEvent, false);
  document.getElementById("Body").addEventListener("customevent", traceEvent, false);
  document.getElementById("Parent").addEventListener("customevent", traceEvent, false);
  document.getElementById("Self").addEventListener("customevent", traceEvent, false);

  var theEvent = new Event("customevent", canBubble:true, cancelable:true);

  // Trace before dispatch.
  traceEvent(theEvent);

  document.getElementById("Self").dispatchEvent(theEvent);

  shouldBe(document.getElementById('console').text, '''
Target = No Target; Phase = NONE; CurrentTarget = No Target;
Target = DivElement (ID: Self); Phase = CAPTURE; CurrentTarget = Window;
Target = DivElement (ID: Self); Phase = CAPTURE; CurrentTarget = HtmlDocument;
Target = DivElement (ID: Self); Phase = CAPTURE; CurrentTarget = HtmlHtmlElement (ID: HTML);
Target = DivElement (ID: Self); Phase = CAPTURE; CurrentTarget = BodyElement (ID: Body);
Target = DivElement (ID: Self); Phase = CAPTURE; CurrentTarget = DivElement (ID: Parent);
Target = DivElement (ID: Self); Phase = AT TARGET; CurrentTarget = DivElement (ID: Self);
Target = DivElement (ID: Self); Phase = AT TARGET; CurrentTarget = DivElement (ID: Self);
Target = DivElement (ID: Self); Phase = BUBBLE; CurrentTarget = DivElement (ID: Parent);
Target = DivElement (ID: Self); Phase = BUBBLE; CurrentTarget = BodyElement (ID: Body);
Target = DivElement (ID: Self); Phase = BUBBLE; CurrentTarget = HtmlHtmlElement (ID: HTML);
Target = DivElement (ID: Self); Phase = BUBBLE; CurrentTarget = HtmlDocument;
Target = DivElement (ID: Self); Phase = BUBBLE; CurrentTarget = Window;
''');
}

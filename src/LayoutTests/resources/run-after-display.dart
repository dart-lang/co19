import "dart:html";
import "../testcommon.dart";

runAfterDisplay(callback) {
    window.requestAnimationFrame((_) {
        // At this point, only the animate has happened, but no compositing
        // or layout.  Use a timeout for the callback so that notifyDone
        // can be called inside of it.
        setTimeout(callback, 0);
    });
}

/**
 * after web-platform-tests/webstorage/event_session_storagearea.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description storageArea property test of session event
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    void onStorageEvent(event) {
         assert_equals(event.storageArea.length, 1);
         var key = event.storageArea.keys[0];
         var value = event.storageArea[key];
         assert_equals(key, "name");
         assert_equals(value, "user1");
         asyncEnd();
    }

    window.sessionStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    asyncStart();
    var el = document.createElement("iframe");
    el.setAttribute('id', 'ifrm');
    el.setAttribute('src', '${testSuiteRoot}/webstorage/iframe/session_set_item_iframe.html');
    document.body.append(el);
}

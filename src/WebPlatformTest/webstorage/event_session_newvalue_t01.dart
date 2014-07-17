/**
 * after web-platform-tests/webstorage/event_session_newvalue.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description newValue property test of session event
 */
import 'dart:collection';
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Queue expected = new Queue.from(['user1', 'user2', null]);
    void onStorageEvent(event) {
        assert_equals(event.newValue, expected.removeFirst());
        if (expected.isEmpty) {
            asyncEnd();
        }
    }

    window.sessionStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    var event = new StorageEvent('storage');
    asyncStart();
    var el = document.createElement("iframe");
    el.setAttribute('id', 'ifrm');
    el.setAttribute('src', '${testSuiteRoot}/webstorage/iframe/session_change_item_iframe.html');
    document.body.append(el);
}

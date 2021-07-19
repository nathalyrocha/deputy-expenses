import consumer from "./consumer"
import Rails from "@rails/ujs";

consumer.subscriptions.create("DeputyChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var channel = $('#deputy-table').data('channel')

    if(channel == 'deputy') {
      Rails.ajax({
        type: "get",
        dataType: 'html',
        url: '/deputies',
        success: function(data) { 
          document.body.innerHTML = data.body.innerHTML
        }
      })
    }
  }
});

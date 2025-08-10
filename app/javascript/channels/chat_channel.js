import consumer from "channels/consumer"

// Chat channel functionality is handled in the individual chat views
// This file is kept for import compatibility

window.App = window.App || {};
window.App.cable = consumer;

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chatbot</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .chat-container {
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .chat-header {
            padding: 10px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .chat-messages {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            background: #e9ecef;
        }
        .message {
            max-width: 70%;
            padding: 10px 15px;
            margin: 5px 0;
            border-radius: 18px;
            clear: both;
            line-height: 1.4;
            white-space: pre-line;
        }
        .user-message {
            background-color: #DCF8C6;
            align-self: flex-end;
            margin-left: auto;
        }
        .bot-message {
            background-color: #ffffff;
            align-self: flex-start;
            margin-right: auto;
        }
        .chat-input {
            display: flex;
            padding: 10px;
            background-color: #ffffff;
            border-top: 1px solid #ccc;
        }
        .chat-input input {
            flex: 1;
            padding: 10px;
            border-radius: 18px;
            border: 1px solid #ccc;
        }
        .chat-input button {
            margin-left: 10px;
            padding: 10px 16px;
            border: none;
            border-radius: 18px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        .quick-replies {
            display: flex;
            flex-wrap: wrap;
            padding: 10px;
            background: #fff;
            border-top: 1px solid #ccc;
        }
        .quick-reply-btn {
            margin: 5px 5px 0 0;
            padding: 6px 12px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 14px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="chat-container">
    <div class="chat-header">
        🤖 Star Organic Shop Chatbot
    </div>
    <div class="chat-messages" id="messages">
        <div class="message bot-message">
            🤖 Hello! I am the virtual assistant of Star Organic Shop.
            I can help you with:
            • 📦 Checking product stock
            • 🛒 Order information
            • 💬 Price inquiries, ordering process, etc.
            Please enter your question below 👇
        </div>
    </div>

    <div class="chat-input">
        <input type="text" id="userInput" placeholder="Type your question..." onkeypress="handleKey(event)">
        <button onclick="sendMessage()">Send</button>
    </div>
</div>

<script>
function appendMessage(content, isUser = true) {
    const messages = document.getElementById('messages');
    const messageDiv = document.createElement('div');
    messageDiv.className = 'message ' + (isUser ? 'user-message' : 'bot-message');
    messageDiv.textContent = content;
    messages.appendChild(messageDiv);
    messages.scrollTop = messages.scrollHeight;
}

function handleKey(event) {
    if (event.key === 'Enter') {
        sendMessage();
    }
}

function sendMessage() {
    const input = document.getElementById('userInput');
    const msg = input.value.trim();
    if (!msg) return;

    appendMessage(msg, true);
    input.value = '';

    fetch('/api/chat', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        body: JSON.stringify({ message: msg })
    })
    .then(res => res.json())
    .then(data => {
        appendMessage(data.reply, false);
    })
    .catch(() => {
        appendMessage("❌ Sorry, the system is busy. Please try again later.", false);
    });
}

function sendQuick(text) {
    document.getElementById('userInput').value = text;
    sendMessage();
}
</script>

</body>
</html>

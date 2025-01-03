<?php
// Start the session to store chat history
session_start();

// Initialize chat history if not set
if (!isset($_SESSION['chat'])) {
    $_SESSION['chat'] = [];
}

// Handle incoming messages via AJAX
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['message'])) {
    $userMessage = trim($_POST['message']);
    $targetLang = trim($_POST['target_lang']);

    if ($userMessage !== '') {
        // Add user message to chat history
        $_SESSION['chat'][] = ['sender' => 'user', 'message' => $userMessage];

        // Translate the message (replace with your NLLB logic)
        $translatedText = translateText($userMessage, $targetLang);

        // Add translated message to chat history
        $_SESSION['chat'][] = ['sender' => 'bot', 'message' => $translatedText];
    }

    // Return the updated chat history as JSON
    echo json_encode(['chat' => $_SESSION['chat']]);
    exit();
}

// Function to simulate translation (replace with actual NLLB integration)
function translateText($text, $lang) {
    // TODO: Integrate your NLLB translation API here
    return "Translated to {$lang}: " . htmlspecialchars($text);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Language Translator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212; /* Primary Background */
            color: #e0e0e0; /* Text Color */
            font-family: 'Helvetica Neue', Arial, sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .chat-container {
            width: 100%;
            max-width: 700px;
            height: 80vh;
            margin: auto;
            background-color: #1e1e1e; /* Secondary Background */
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            box-shadow: 0 4px 30px rgba(0,0,0,0.5);
        }
        .chat-header {
            padding: 20px;
            background-color: #0a84ff; /* Accent Color */
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff;
        }
        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            background-color: #1e1e1e;
        }
        .chat-message {
            margin-bottom: 15px;
            display: flex;
        }
        .chat-message.user {
            justify-content: flex-end;
        }
        .chat-message.bot {
            justify-content: flex-start;
        }
        .chat-message .message {
            max-width: 70%;
            padding: 12px 18px;
            border-radius: 20px;
            font-size: 1rem;
        }
        .chat-message.user .message {
            background-color: #0a84ff; /* User Message Background */
            color: #ffffff;
            border-bottom-right-radius: 0;
        }
        .chat-message.bot .message {
            background-color: #2c2c2c; /* Bot Message Background */
            color: #e0e0e0;
            border-bottom-left-radius: 0;
        }
        .chat-input {
            padding: 15px;
            background-color: #1e1e1e;
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .chat-input textarea {
            flex: 1;
            resize: none;
            border: none;
            border-radius: 10px;
            padding: 10px 15px;
            background-color: #2c2c2c;
            color: #e0e0e0;
            font-size: 1rem;
        }
        .chat-input textarea:focus {
            outline: none;
            background-color: #3a3a3a;
        }
        .chat-input select, .chat-input button {
            border: none;
            border-radius: 10px;
            padding: 10px 15px;
            background-color: #0a84ff; /* Accent Color */
            color: #ffffff;
            cursor: pointer;
            font-size: 1rem;
        }
        .chat-input select {
            width: 150px;
        }
        .chat-input button:hover {
            background-color: #007aff; /* Darker Accent on Hover */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="translation.php">Translator</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="translation.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="metrics.php">Metrics</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="chat-container">
        <div class="chat-header">
            Language Translator
        </div>
        <div class="chat-messages" id="chatMessages">
            <?php foreach ($_SESSION['chat'] as $chat): ?>
                <div class="chat-message <?= $chat['sender']; ?>">
                    <div class="message">
                        <?= $chat['message']; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="chat-input">
            <textarea id="messageInput" rows="1" placeholder="Type your message..."></textarea>
            <select id="targetLang">
                <option value="es">Spanish</option>
                <option value="fr">French</option>
                <option value="de">German</option>
                <!-- Add more languages as needed -->
            </select>
            <button id="sendButton">Send</button>
        </div>
    </div>

    <script>
        const sendButton = document.getElementById('sendButton');
        const messageInput = document.getElementById('messageInput');
        const targetLang = document.getElementById('targetLang');
        const chatMessages = document.getElementById('chatMessages');

        sendButton.addEventListener('click', () => {
            const message = messageInput.value.trim();
            const lang = targetLang.value;

            if (message === '') return;

            // Append user message
            appendMessage('user', message);
            messageInput.value = '';

            // Send AJAX request
            fetch('translation.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `message=${encodeURIComponent(message)}&target_lang=${encodeURIComponent(lang)}`
            })
            .then(response => response.json())
            .then(data => {
                // Clear current messages
                chatMessages.innerHTML = '';
                // Append all messages from chat history
                data.chat.forEach(chat => {
                    appendMessage(chat.sender, chat.message);
                });
                // Scroll to bottom
                chatMessages.scrollTop = chatMessages.scrollHeight;
            })
            .catch(error => console.error('Error:', error));
        });

        function appendMessage(sender, message) {
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('chat-message', sender);
            const messageContent = document.createElement('div');
            messageContent.classList.add('message');
            messageContent.innerHTML = message;
            messageDiv.appendChild(messageContent);
            chatMessages.appendChild(messageDiv);
            // Scroll to bottom
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        // Allow sending message with Enter key
        messageInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                sendButton.click();
            }
        });
    </script>
</body>
</html>

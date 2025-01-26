<?php
$text = "Hello from PHP";
$lang = "urd_Arab";
$command = "python3 /Users/zen/Coding/language_translation_site/hugging_face_api.py " . escapeshellarg($text) . " " . escapeshellarg($lang);
$output = shell_exec($command);
if ($output === null) {
    echo "Error: Translation script failed.\n";
} else {
    echo "Output: " . $output . "\n";
}
?>

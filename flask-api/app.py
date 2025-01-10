from fairseq.translation.scripts.run_pipeline import process_translation_request
from flask import Flask, request, jsonify
import os
import logging


# Initialize Flask app
app = Flask(__name__)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[logging.StreamHandler()]
)
logger = logging.getLogger(__name__)

@app.route('/translate', methods=['POST'])
def translate():
    try:
        # Log incoming request
        logger.info("Received translation request.")
        
        # Parse the JSON request
        data = request.json
        input_text = data.get('text', '').strip()  # Get the 'text' field from the JSON request
        target_lang = data.get('target_lang', 'urd_Arab').strip()  # Get the 'target_lang' field from the JSON request
        
        if not input_text:
            logger.warning("No input text provided.")
            return jsonify({'error': 'No input text provided'}), 400

        # Log the received input
        logger.info(f"Input text received: {input_text}")
        logger.info(f"Target language set to: {target_lang}")

        # Process translation using the translate function from run_pipeline.py
        model_path = "/Users/zen/Coding/fairseq/models/nllb-200-distilled-600M"
        translated_text = process_translation_request(input_text, model_path, target_lang)

        if translated_text:
            # Log and return the translated text
            logger.info(f"Translation successful. Returning translated text.")
            return jsonify({'translation': translated_text})
        else:
            logger.error("Translation failed.")
            return jsonify({'error': 'Translation failed'}), 500

    except Exception as e:
        logger.error(f"Error during translation: {e}")
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    logger.info("Starting Flask server...")
    app.run(host='0.0.0.0', port=5001)

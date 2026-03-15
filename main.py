import argparse
import requests
import sys
import os

def send_discord_notification(webhook_url, message, image_path=None):
    """
    Discord Webhookに通知を送信する。

    :param webhook_url: Discord WebhookのURL
    :param message: 送信するメッセージ
    :param image_path: 添付する画像ファイルのパス (任意)
    """
    try:
        if image_path:
            if not os.path.exists(image_path):
                print(f"Error: Image file not found at '{image_path}'")
                sys.exit(1)
            
            with open(image_path, 'rb') as f:
                files = {
                    'file': (os.path.basename(image_path), f)
                }
                payload = {
                    'content': message
                }
                response = requests.post(webhook_url, data=payload, files=files)
        else:
            payload = {
                'content': message
            }
            response = requests.post(webhook_url, json=payload)

        response.raise_for_status()  # ステータスコードが2xxでない場合に例外を発生させる

        print("Successfully sent the notification to Discord.")

    except requests.exceptions.RequestException as e:
        print(f"Error sending notification to Discord: {e}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Send a notification to a Discord channel.")
    parser.add_argument("--webhook-url", required=True, help="The Discord Webhook URL.")
    parser.add_argument("--message", required=True, help="The message content to send.")
    parser.add_argument("--image", help="The path to an image file to attach.")

    args = parser.parse_args()

    send_discord_notification(args.webhook_url, args.message, args.image)

package OrderSystem;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import io.github.cdimascio.dotenv.Dotenv;

public class TextSender {
  private final String ACCOUNT_SID;
  private final String AUTH_TOKEN;
  private final String FROM_NUMBER;

  public TextSender() {
    Dotenv dotenv = Dotenv.load();
    this.ACCOUNT_SID = dotenv.get("ACCOUNT_SID");
    this.AUTH_TOKEN = dotenv.get("AUTH_TOKEN");
    this.FROM_NUMBER = dotenv.get("FROM_NUMBER");
  }

  public void sendMessage(String text, String mobile) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.creator(
        new PhoneNumber(mobile),
        new PhoneNumber(FROM_NUMBER),
        text).create();

    System.out.println(message.getSid());
  }
}

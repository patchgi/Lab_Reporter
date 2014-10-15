import processing.serial.*;
import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.http.*;
import twitter4j.internal.util.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;

String consumerKey = "xxx";
String consumerSecret = "xxx";
String accessToken = "xxx";
String accessSecret = "xxx";
Twitter myTwitter;

Serial input;

int savetime;

void setup() {
  input=new Serial(this, Serial.list()[0], 9600);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessSecret);
  myTwitter = new TwitterFactory(cb.build()).getInstance();
}

void draw() {
}
void serialEvent(Serial port){

  int inputdata=port.read();

  try {
    if (savetime!=day()) {
      if (hour()>9) {
        Status st = myTwitter.updateStatus("open Lab "+hour()+judgeUpper(minute())+minute()+judgeUpper(second())+second());
        println("Successfully updated the status to [" + st.getText() + "].");
        savetime=day();
      }
      else {
        Status st = myTwitter.updateStatus("open Lab 0"+hour()+judgeUpper(minute())+minute()+judgeUpper(second())+second());
        println("Successfully updated the status to [" + st.getText() + "].");
        savetime=day();
      }
    }
  }

  catch (TwitterException e) {
    println("Error status code: " + e.getStatusCode());
  }
}


String judgeUpper(int time) {
  if (time>9) {
    return ":";
  }

  else {
    return ":0";
  }
}


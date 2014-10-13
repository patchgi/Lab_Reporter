int last_sw=HIGH,sw=HIGH;
boolean OpenLab=false;
void setup(){
  pinMode(2,INPUT);
  Serial.begin(9600);
}

void loop(){
  sw=digitalRead(2);

  if(sw==HIGH&&last_sw==LOW){
    OpenLab=true;
  }
  else{
    OpenLab=false;
  }
  if(OpenLab){
    Serial.write(1);
  }
  last_sw=sw;
}






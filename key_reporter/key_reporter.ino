int count=0;
void setup(){
  pinMode(2,INPUT);
  Serial.begin(9600);
}

void loop(){
  int sw=digitalRead(2);


  if(sw==HIGH){
    count=0;
  }

  else{
    count++;
  }

  if(count==1){
    Serial.write(1);
  }
}





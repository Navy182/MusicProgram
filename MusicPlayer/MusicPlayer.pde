//Global Variables
//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
void setup() {
  //size() or fullScreen()
  //Display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String groove = "";
  String extension = ".mp3";
  String pathway = ""; //Relative Path
  String path = sketchPath( ); //Absolute Path
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  println(path);
  song1 = minim.loadFile( path );
  //song1.loop(0);
} //End setup
//
void draw() {} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song1.play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  if ( key=='L' || key=='l' ) song1.loop(0); //Parameter is number of repeats
  //song1.loop(0);
  // //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song1.loop(loopNum); //Parameter is number of repeats
    //
    {
  if ( key=='L' || key=='l' ) song1.loop(); //Infinite Loop, no parameter OR -1
  if ( key=='M' || key=='m' ) { //MUTE Button
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( song1.isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      song1.unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song1.mute();
    }
  } //End MUTE
 //
} //End keyPressed
//
void mousePressed() {} //End mousePressed
//
//End MAIN Program

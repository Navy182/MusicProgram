//Global Variables
File musicFolder; //Class for java.io.* library
Minim minim; //creates object to access all functions
int numberOfSongs = 1; //Placeholder Only, reexecute lines after fileCount Known
AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs]; //same as above
PFont generalFont;
color purple = #2C08FF;
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
  String cutmeoff = "https://www.youtube.com/watch?v=ptH2DVO4rcc";
  String extension = ".mp3";
  String pathway = ""; //Relative Path
  String path = sketchPath( ); //Absolute Path
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  println(path);
  song1 = minim.loadFile( path );
  //song1.loop(0);
  String relativePathway = "FreeWare Music/MusicDownload/"; //Relative Path
  String absolutePath = sketchPath( relativePathway ); //Absolute Path
  println("Main Directory to Music Folder", absolutePath);
  musicFolder = new File(absolutePath);
  int musicFileCount = musicFolder.list().length;
  println("File Count of the Music Folder", musicFileCount);
  File[] musicFiles = musicFolder.listFiles(); //String of Full Directies
  println("List of all Directories of Each Song to Load into music playlist");
  printArray(musicFiles);
  //Demonstration Only, files know their names in Java.IO Library
  for ( int i = 0; i < musicFiles.length; i++ ) {
    println("File Name", musicFiles[i].getName() );
  }
  //NOTE: take each song's pathway and load the music into the PlayList
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
  }
  // Re-execute Playlist Population, similar to DIV Population
  int numberOfSongs = musicFileCount; //Placeholder Only, reexecute lines after fileCount Known
  playList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
  playListMetaData = new AudioMetaData[numberOfSongs]; //same as above
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  //
  for ( int i=0; i<musicFileCount; i++ ) {
    playList[i]= minim.loadFile( songFilePathway[i] );
    playListMetaData[i] = playList[i].getMetaData();
  } //End Music Load

} //End setup
//
void draw() {} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song1.play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  //.play() includes .rewind()
  //
  if ( key>='1' || key<='9' ) { //Loop Button, previous (key=='1' || key=='9')
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song1.loop(loopNum); //Parameter is number of repeats
    //
  }
  if ( key=='L' || key=='l' ) song1.loop(); //Infinite Loop, no parameter OR -1
  //
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
  //Possible ERROR: FF rewinds to parameter milliseconds from SONG Start
  //Possible ERROR: FR rewinds to parameter milliseconds from SONG Start
  //How does this get to be a true ff and fr button
  //Actual .skip() allows for varaible ff & fr using .position()+-
  if ( key=='F' || key=='f' ) song1.skip( 0 ); //SKIP forward 1 second (1000 milliseconds)
  if ( key=='R' || key=='r' ) song1.skip( 1000 ); //SKIP  backawrds 1 second, notice negative, (-1000 milliseconds)
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
  if ( key=='S' | key=='s' ) {
    if ( song1.isPlaying() ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.rewind(); //Not Necessary
    }
  }
  //
  //Simple Pause Behaviour: .pause() & hold .position(), then PLAY
  if ( key=='Y' | key=='y' ) {
    if ( song1.isPlaying()==true ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.play(); //ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {

} //End mousePressed
//
//End MAIN Program

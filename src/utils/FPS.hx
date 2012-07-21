package utils;

import nme.Lib;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.events.Event;

class FPS extends TextField
{
   public var fps:Int;
   var prev:Int;
   var times:Array<Float>;

   public function new(inX:Float=10.0, inY:Float=10.0, inCol:Int = 0x000000)
   {
      super();
      x = inX;
      y = inY;
      selectable = false;
      defaultTextFormat = new TextFormat("_sans", 12, inCol, true);
      htmlText = "FPS:";
      multiline = true;
      width = 100;
      height = 20;
      times = [];
      addEventListener(Event.ENTER_FRAME, onEnter);
   }

   public function onEnter(_)
   {
      var now = Lib.getTimer() / 1000;
      times.push(now);
      while(times[0]<now-1)
         times.shift();
      fps = times.length;
      if (visible && prev != fps)
      {
         prev = fps;
         htmlText = "FPS: " + fps;
      }
   }

}

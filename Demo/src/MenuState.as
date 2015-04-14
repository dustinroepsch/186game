package {
	import citrus.core.starling.StarlingState;   
    import feathers.layout.HorizontalLayout;   
    import feathers.controls.LayoutGroup;   
    import flash.desktop.NativeApplication;   
    import starling.display.Button;   
    import starling.display.DisplayObject;   
    import starling.display.Image;   
    import starling.events.Event;   
    import starling.extensions.krecha.ScrollImage;   
    import starling.extensions.krecha.ScrollTile;   
    import starling.textures.Texture;   
    import starling.textures.TextureAtlas;   
    import constant.TexNameConst;   
    import constant.EmbedConst;   
    import state.StarlingDemoGameState;   
     
    public class MenuState extends StarlingState   
    {   
        private var atlas:TextureAtlas;   
         
        private var bg:ScrollImage;   
         
        private var title:Image;   
         
        private var play:Button;   
        private var options:Button;   
        private var score:Button;   
        private var exit:Button;   
         
        private var dispObjectArray:Vector.<DisplayObject> = new Vector.<DisplayObject>();   
         
        public function MenuState()   
        {   
            super();   
        }   
         
        override public function initialize():void   
        {   
            super.initialize();   
             
            atlas = new TextureAtlas(Texture.fromBitmap(new EmbedConst.ATLAS_IMAGE()), XML(new EmbedConst.ATLAS_XML()));   
             
            var tile:ScrollTile = new ScrollTile(atlas.getTexture(TexNameConst.BG), true);   
             
            bg = new ScrollImage(stage.stageWidth, stage.stageHeight);   
            bg.addLayer(tile);   
            addChild(bg);   
             
            title = new Image(atlas.getTexture(TexNameConst.TITLE));   
            title.alignPivot();   
            title.x = stage.stageWidth / 2;   
            title.y = title.height / 2 + 50;   
            addChild(title);   
             
            var layout:HorizontalLayout = new HorizontalLayout();   
            layout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;   
            layout.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;   
            layout.gap = 10;   
             
            var buttonContainer:LayoutGroup = new LayoutGroup();   
            buttonContainer.layout = layout;   
            buttonContainer.width = 800;   
            buttonContainer.height = 100;   
            buttonContainer.alignPivot();   
            buttonContainer.x = stage.stageWidth / 2;   
            buttonContainer.y = stage.stageHeight - buttonContainer.height / 2 - 30;   
            addChild(buttonContainer);   
             
            play = getButton(TexNameConst.PLAY_1);   
            buttonContainer.addChild(play);   
             
            score = getButton(TexNameConst.SCORE_1);   
            buttonContainer.addChild(score);   
             
            options = getButton(TexNameConst.OPTIONS_1);   
            buttonContainer.addChild(options);   
        
            exit = getButton(TexNameConst.EXIT_1);   
            buttonContainer.addChild(exit);   
            
            dispObjectArray.push(bg, title, buttonContainer);   
        }   
       
        override public function update(timeDelta:Number):void   
        {   
            super.update(timeDelta);   
             
            if (bg)   
            {   
                bg.tilesOffsetX += .2;   
                bg.tilesOffsetY += .2;   
            }   
        }   
         
        private function buttonClicked(event:Event):void   
        {   
            var button:String = Button(event.target).name;   
             
            switch (button)   
            {   
                case TexNameConst.PLAY_1:    
                    Main(_ce).changeState(new StarlingDemoGameState());   
                    break;   
 
                
                case TexNameConst.OPTIONS_1:    
                    break;   
                 
                case TexNameConst.SCORE_1:    
                    break;   
                 
                case TexNameConst.EXIT_1:    
                    NativeApplication.nativeApplication.exit();   
                    break;   
            }   
        }   
         
        private function getButton(name:String, scale:Number = 1, hasDownTexture:Boolean = true):Button   
        {   
            var up:Texture = atlas.getTexture(name);   
            var down:Texture;   
             
            if (hasDownTexture)   
            {   
                down = atlas.getTexture(name.replace("1", "2"));   
            }   
            else   
            {   
                down = null;   
            }   
             
            var button:Button = new Button(up, "", down);   
            button.name = name;   
            button.scaleX = button.scaleY = scale;   
            button.alphaWhenDisabled = 1;   
            button.scaleWhenDown = .9;   
            button.addEventListener(Event.TRIGGERED, buttonClicked);   
             
            return button;   
        }   
         
        override public function destroy():void   
        {   
            for (var i:int = dispObjectArray.length - 1; i >= 0; i--)   
            {   
                removeChild(dispObjectArray[i], true);   
            }   
             
            atlas.dispose();   
            atlas = null;   
             
            super.destroy();   
        }   
    }
}
